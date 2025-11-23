#!/bin/bash
set -e

ZSHRC_FILE=$1
echo "--- Testing $ZSHRC_FILE ---"

# Create a temporary, cleaned version of the zshrc to avoid issues with commands
# that require a tty, like `GPG_TTY=$(tty)`.
TEMP_ZSHRC=$(mktemp)
# Also ignore fzf which requires user input
grep -v 'GPG_TTY=$(tty)' "$ZSHRC_FILE" | grep -v 'source <(fzf --zsh)' > "$TEMP_ZSHRC"


# Helper function to run a command in a zsh shell that sources the rc file
run_in_zsh() {
  # We use -i for interactive to ensure aliases are loaded.
  # The env gymnastics are to avoid the script sourcing the user's own local zshrc.
  env -i HOME="$HOME" USER="$USER" PATH="$PATH" SHELL="zsh" zsh -ic "source $TEMP_ZSHRC && $1"
}

# --- File-specific Tests ---
if [[ "$ZSHRC_FILE" == *".zshrc"* ]]; then
  echo "Running tests for .zshrc file..."

  echo "Checking EDITOR variable..."
  EDITOR_VAR=$(run_in_zsh 'echo $EDITOR')
  if [[ "$EDITOR_VAR" != "nvim" ]]; then
    echo "Error: \$EDITOR is '$EDITOR_VAR', expected 'nvim'."
    exit 1
  fi
  echo "OK"

  if [[ "$ZSHRC_FILE" == *"zsh-popos/.zshrc"* ]]; then
    echo "Running tests for zsh-popos..."

    echo "Checking 'apt' function..."
    # 'which' will show the function definition
    FUNC_DEF=$(run_in_zsh 'which apt')
    if ! echo "$FUNC_DEF" | grep -q "apt ()"; then
      echo "Error: 'apt' function not found or defined correctly."
      exit 1
    fi
    echo "OK"

    echo "Checking 'lg' alias..."
    ALIAS_DEF=$(run_in_zsh 'alias lg')
    if [[ "$ALIAS_DEF" != "lg=lazygit" ]]; then
      echo "Error: 'lg' alias is '$ALIAS_DEF', expected 'lg=lazygit'."
      exit 1
    fi
    echo "OK"
  fi
fi

# Clean up the temp file
rm "$TEMP_ZSHRC"

echo "--- Success: $ZSHRC_FILE passed all tests ---"

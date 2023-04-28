-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-x>"] = ":q<cr>"
lvim.keys.normal_mode["<leader>u"] = ":UndotreeToggle<cr>"

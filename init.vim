source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

" Themes

"source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/themes/gruvbox.vim
source $HOME/.config/nvim/themes/airline.vim

" Lua
luafile $HOME/.config/nvim/lua/bash-lsp.lua
luafile $HOME/.config/nvim/lua/python-lsp.lua
luafile $HOME/.config/nvim/lua/compe-config.lua
luafile $HOME/.config/nvim/lua/treesitter.lua
luafile $HOME/.config/nvim/lua/tserver.lua
"luafile $HOME/.config/nvim/lua/nvim-tree.lua
"luafile $HOME/.config/nvim/lua/plug-colorizer.lua

" Config
"source $HOME/.config/nvim/plug-config/coc.vim
"source $HOME/.config/nvim/plug-config/rnvimr.vim
"source $HOME/.config/nvim/plug-config/fzf.vim
"source $HOME/.config/nvim/plug-config/flutter.vim
source $HOME/.config/nvim/plug-config/telescope.vim
"source $HOME/.config/nvim/plug-config/nvim-tree.vim

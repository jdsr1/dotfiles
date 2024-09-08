" Dotfile:     init.vim (neovim configuration file)
" Last Change: 2024.09.08


" Load vim configuration:
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


" Remove how to disable mouse:
aunmenu PopUp.How-to\ disable\ mouse
aunmenu PopUp.-1-


" Configure mini.nvim plugin
lua require('mini.statusline').setup()
lua require('mini.git').setup()
lua require('mini.diff').setup()
lua require('mini.icons').setup()

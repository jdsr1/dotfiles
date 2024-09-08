" Dotfile:     vimrc
" Last Change: 2024.09.08


" Plugin manager from junegunn/vim-plug
" ----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" mini nvim
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
Plug 'echasnovski/mini.icons'

" Files and file search
Plug 'kien/ctrlp.vim'
Plug 'nvim-neo-tree/neo-tree.nvim'

" LaTeX support
Plug 'lervag/vimtex'

" Autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Color schemes
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'folke/tokyonight.nvim'

" Python snippets
Plug 'SirVer/ultisnips'

call plug#end()


" Text settings.
" ----------------------------------------------------------------------
syntax on                                  " Syntax colouring on
set nowrap                                 " Do not wrap lines
set number                                 " Show line numbers
set mouse=ni                               " Toggle mouse for ni modes
set tabstop=4                              " One tab = 4 spaces
set shiftwidth=4                           
set expandtab                              " Tabs -> spaces
set smartindent                            " Keep previous indentation
set autoindent
set textwidth=80


" Search.
" ----------------------------------------------------------------------
set hlsearch                               " Highlight search matches
set ignorecase
set incsearch                              " Match while typing


" Simple status line.
" ----------------------------------------------------------------------
set laststatus=2                           " Always show status line
set statusline=                            " Empty status line
set statusline+=%3*[%n]                    " Buffer number
set statusline+=%1*\ %-.32t\ %3*%=         " Trail of file name
set statusline+=[%Y%H%M%R%W]\ %*           " File type and flags
set statusline+=%1*%4p%%\ %*               " Percentage
set statusline+=%2*%9(%l:%c%)\ %*          " Line and column


" Color settings.
" ----------------------------------------------------------------------
colorscheme tokyonight-night

hi User1 cterm=bold ctermbg=DarkBlue ctermfg=white
hi User2 cterm=bold ctermbg=DarkCyan ctermfg=white
hi User3 cterm=bold ctermbg=DarkGray ctermfg=white

hi User1 gui=bold guibg=DarkBlue guifg=white
hi User2 gui=bold guibg=DarkCyan guifg=white
hi User3 gui=bold guibg=DarkGray guifg=white


" Configuration for VimTeX. Originally taken from castel.dev.
" ----------------------------------------------------------------------
let g:tex_flavor               = 'pdflatex'
let g:vimtex_view_method       = 'zathura'
let g:vimtex_indent_enabled    = 0
let g:vimtex_compiler_progname = 'nvr'


" Configuration for CtrlP.
" ----------------------------------------------------------------------
let g:ctrlp_by_filename=1


" Configuration of ultisnips.
" ----------------------------------------------------------------------
let g:UltiSnipsEditSplit='horizontal'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'


" Mapleader and mappings.
" TODO: group autocommands by buffers.
" ----------------------------------------------------------------------
let mapleader='-'
let maplocalleader=']'

" Edit and source vimrc file
nnoremap <leader>ev :split $MYVIMRC <cr>
nnoremap <leader>sv :source $MYVIMRC <cr>

" Writing and moving
nnoremap zq :q!<cr>
nnoremap zw :wq!<cr>
nnoremap zj <c-d>
nnoremap zk <c-u>

onoremap p i(

" LaTeX specific
nnoremap <leader>ap ?%\\|^$<cr>jVNkgq :nohlsearch<cr>:w<cr>

" Miscellaneous
nnoremap <space> :nohlsearch<cr><space>


" Other settings.
" ----------------------------------------------------------------------
" Remember me, vim
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Backspace consumes indent, end of line, and start
" (mandatory for gvim @ windows)
set backspace=2

" vimdiff configuration
if &diff
    syntax off
endif

" Termdebug
let g:termdebug_wide=1


" Temporary settings.
" ----------------------------------------------------------------------

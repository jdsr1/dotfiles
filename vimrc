" Dotfile:     vimrc
<<<<<<< HEAD
" Last Change: 2023 Jul 19

" Plugins. From junegunn/vim-plug @ github.com
" ----------------------------------------------------------------------
"call plug#begin('~/.vim/plugged')
=======
" Last Change: 2024 Apr 10

" Plugins. From junegunn/vim-plug @ github.com
" ----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
>>>>>>> 6b3445e (vimrc and README files updated.)

" Syntastic
"Plug 'vim-syntastic/syntastic'

" LaTex and Python support
<<<<<<< HEAD
"Plug 'lervag/vimtex'
"Plug 'davidhalter/jedi-vim'
=======
Plug 'lervag/vimtex'
Plug 'davidhalter/jedi-vim'
>>>>>>> 6b3445e (vimrc and README files updated.)

" Files and file search
"Plug 'preservim/nerdtree'
"Plug 'kien/ctrlp.vim'

" Snippets
"Plug 'SirVer/ultisnips'

"call plug#end()


" Text settings.
" ----------------------------------------------------------------------
syntax on                                   " Syntax colouring on
set nowrap                                  " Do not wrap lines
set number                                  " Show line numbers
set mouse=a                                 " Toggle mouse for all modes
set tabstop=4                               " One tab = 4 spaces
set shiftwidth=4                            
set expandtab                               " Tabs -> spaces
set smartindent                             " Keep previous indentation
set autoindent
set textwidth=80


" Search
" ----------------------------------------------------------------------
set hlsearch                                " highlight search matches
set ignorecase
set incsearch                               " match while typing


" Simple status line.
" ----------------------------------------------------------------------
set laststatus=2                           " Always show status line
set statusline=                            " Empty status line
set statusline+=%3*[%n]                    " Buffer number
set statusline+=%1*\ %-.32t\ %3*%=         " Trail of file name
set statusline+=[%Y%H%M%R%W]\ %*           " File type and flags
set statusline+=%1*%4p%%\ %*               " Percentage
set statusline+=%2*%9(%l:%c%)\ %*          " Line and column

" Need to set colors
"colorscheme delek
hi User1 cterm=bold ctermbg=DarkBlue ctermfg=white
hi User2 cterm=bold ctermbg=DarkCyan ctermfg=white
hi User3 cterm=bold ctermbg=DarkGray ctermfg=white
" for the gui version of vim
hi User1 gui=bold guibg=DarkBlue guifg=white
hi User2 gui=bold guibg=DarkCyan guifg=white
hi User3 gui=bold guibg=DarkGray guifg=white


" Configuration for vimtex. Mainly taken from castel.dev
" ----------------------------------------------------------------------
let g:tex_flavor='pdflatex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
"set conceallevel=2
"let g:tex_conceal='abdmg'


" Configuration for CtrlP
" ----------------------------------------------------------------------
let g:ctrlp_by_filename=1


" Configuration of ultisnips
" ----------------------------------------------------------------------
let g:UltiSnipsEditSplit='horizontal'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'


" Extra settings.
" ----------------------------------------------------------------------
" Mapleader & mappings
let mapleader='-'
let maplocalleader=']'

nnoremap <leader>ev :split $MYVIMRC <cr>   " edit vimrc file
nnoremap <leader>sv :source $MYVIMRC <cr>  " source vimrc
nnoremap <leader>ul o# <esc>78a-<esc>      " underline current line

" Writing and moving
nnoremap zq :q!<cr>
nnoremap zw :wq!<cr>
nnoremap zj <c-d>
nnoremap zk <c-u>
onoremap p i(

" Don't use arrow keys!
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <down> <nop>

" Abbreviations
iabbrev stpy #!/usr/bin/python<cr>#!encoding:utf-8<cr><cr><cr>
iabbrev stsh #!/bin/bash<cr><cr>##     Purpose:<cr>## Last change:<cr><cr>

" Remember me, vim
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Backspace consumes indent, end of line, and start
" (mandatory for gvim @ windows)
set backspace=2


" Colorscheme for vimdiff
if &diff
    colorscheme blue
endif

" Termdebug
let g:termdebug_wide=1

" Dotfile:     vimrc
" Last Change: 2024.05.01


" Plugins. From junegunn/vim-plug @ github.com
" ----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Syntastic
Plug 'vim-syntastic/syntastic'

" LaTex and Python support
Plug 'lervag/vimtex'
Plug 'davidhalter/jedi-vim'

" Files and file search
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'

" Snippets
Plug 'SirVer/ultisnips'

call plug#end()


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
let g:vimtex_view_method='evince'
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


" Extra settings. TODO: group autocommands by buffers.
" ----------------------------------------------------------------------
" Mapleader & mappings
let mapleader='-'
let maplocalleader=']'

" -- edit vimrc file
nnoremap <leader>ev :split $MYVIMRC <cr>
" -- source vimrc file
nnoremap <leader>sv :source $MYVIMRC <cr>

" -- underline current line
nnoremap <leader>ul o# <esc>78a-<esc>
" -- temporarily deactive search highlighting
nnoremap <space> :nohlsearch<cr><space>
" -- adjust paragraph (delimited by % signs for LaTeX)
nnoremap <leader>ap ?%\\|^$<cr>jVNkgq :nohlsearch<cr>

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

" basic -------{{{
set nu
"colorscheme murphy
"tab => space
set ts=4 
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
set cindent
" }}}

" useful map --- {{{
let mapleader = "\\"

nnoremap <F5> :w<CR>
inoremap <F5> <ESC>:w<CR>
nnoremap <F2> :q<CR>
inoremap <F2> <ESC>:q<CR>
inoremap jk <ESC>
inoremap {} {<CR>}<ESC>O
inoremap "" ""<ESC>i
nnoremap H ^
nnoremap L $

"ctrl+d delete a line
nnoremap <c-u> viwU
inoremap <c-u> <ESC>viwUi
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
inoremap <leader>" <esc>viw<esc>a"<esc>hbi"<esc>leli
nnoremap <leader>d dd
inoremap <leader>d <esc>ddi

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"}}}

"useless --- {{{
inoremap <right> <nop>
inoremap <left> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
" }}}

"status line --- {{{
set laststatus=2
set statusline=%f\ %y%R%M%=%l,%c\ \ total:%L\ \ %p%% 
"}}} 

" file settings --- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

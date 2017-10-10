" basic -------{{{
set nocompatible
" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'DoxygenToolkit.vim'
call vundle#end()
filetype plugin indent on

set nu
"tab => space
set ts=4
set expandtab
set shiftwidth=4
set softtabstop=4
"indent
set autoindent
set smartindent

set hlsearch "search highlight
set incsearch "search highlight when type keyword

set history=50 " keep 50 lines of command line history
set ruler "show the cursor position all the time
set showcmd " display incomplete commands

"backup(unuse)
"if has("vms")
"  set nobackup" do not keep a backup file, use versions instead
"else
"  set backup " keep a backup file (restore to previous version)
"  set undofile " keep an undo file (undo changes after closing)
"endif

" }}}

" mappings --- {{{
let mapleader = "-"

nnoremap <F4> :%retab!<cr>
nnoremap <F3> :%s/\s\+$//g<cr>$
nnoremap <F5> :w<CR>
inoremap <F5> <ESC>:w<CR>
nnoremap <F2> :q<CR>
inoremap <F2> <ESC>:q<CR>

inoremap jk <ESC>
inoremap {} {<CR>}<ESC>O
inoremap "" ""<ESC>i
nnoremap H ^
nnoremap L $
nnoremap J <c-f>
nnoremap K <c-b>

"ctrl+d delete a line
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
inoremap <leader>" <esc>viw<esc>a"<esc>hbi"<esc>leli

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
inoremap <C-U> <C-G>u<C-U>

nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

"tab
nnoremap <silent><tab>e :tabnew<cr>
nnoremap <silent><Tab><tab> :tabn<cr>
nnoremap <silent><leader>1 :tabn 1<cr>
nnoremap <silent><leader>2 :tabn 2<cr>
nnoremap <silent><leader>3 :tabn 3<cr>
nnoremap <silent><leader>4 :tabn 4<cr>
nnoremap <silent><leader>5 :tabn 5<cr>
nnoremap <silent><leader>6 :tabn 6<cr>
nnoremap <silent><leader>7 :tabn 7<cr>
nnoremap <silent><leader>8 :tabn 8<cr>
nnoremap <silent><leader>9 :tabn 9<cr>
nnoremap <silent><leader>0 :tabn 10<cr>

"}}}

" styles --- {{{
" status style
set laststatus=2
set statusline=[NAME:%f]\ %y%R%M\ [FORMAT=%{&ff}]%=[POS=%l,%c]\ \ [TOTAL:%L]\ \ [%p%%]
" tab style
function ShortTabLine()
    let ret = ''
    for i in range(tabpagenr('$'))
        " select the color group for highlighting active tab
        if i + 1 == tabpagenr()
            let ret .= '%#errorMsg#'
        else
            let ret .= '%#TabLine#'
        endif
        " " find the buffername for the tablabel
        let buflist = tabpagebuflist(i+1)
        let winnr = tabpagewinnr(i+1)
        let buffername = bufname(buflist[winnr - 1])
        let filename = fnamemodify(buffername,':t')
        " " check if there is no name
        if filename == ''
            let filename = 'noname'
        endif
        " " only show the first 6 letters of the name and
        " " .. if the filename is more than 8 letters long
        if strlen(filename) >=8
            let ret .= '['. filename[0:5].'..]'
        else
            let ret .= '['.filename.']'
        endif
    endfor

    " after the last tab fill with TabLineFill and reset tab page #
    let ret .= '%#TabLineFill#%T'
    return ret
endfunction
set tabline=%!ShortTabLine()
" show which line the cursor is
set cursorline
" }}}

" special file settings --- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker " fold all groups when open vim file 
augroup END

highlight LineExceedNotice ctermbg=red guibg=red cterm=bold ctermfg=white guifg=white
highlight LineSpaceNotice ctermbg=cyan guibg=cyan ctermfg=white guifg=white
augroup filetype_cpp
    autocmd!
    autocmd FileType c,cpp match LineExceedNotice /\%>80v.\+/ " highlight lines that width > 80
    autocmd FileType c,cpp 2match LineSpaceNotice /[ \t]\+$/ " highlight spaces in the end of line
augroup END
"}}}

" doxygen toolkit --- {{{

let g:DoxygenToolkit_authorName = "JiaoLinfeng, jiaolinfeng@esunny.cc"
let g:DoxygenToolkit_versionString = "1.0"

nnoremap fl :DoxLic<cr>
nnoremap fa :DoxAuthor<cr>
nnoremap fb :Dox<cr>

" }}}

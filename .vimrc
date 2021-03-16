call plug#begin('~/.vim/plugged')

Plug 'https://tpope.io/vim/surround.git'
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'dusans/vim-hardmode'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'jszakmeister/vim-togglecursor'
Plug 'lervag/vimtex'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

call plug#end()

"autocmd vimenter * colorscheme dracula 
set number relativenumber

colo dracula

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:tex_flavor = 'latex'

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10 

set showbreak=>
set linebreak

noremap <expr> k v:count == 0 ? 'gk' : 'k'
noremap <expr> j v:count == 0 ? 'gj' : 'j'
noremap ^ g^
noremap $ g$
noremap 0 g0

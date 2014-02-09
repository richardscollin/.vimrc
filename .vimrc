"Indentation Stuff
set smartindent
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

set nowrap
"Line number Stuff
set relativenumber
set number



if has("autocmd")
    "Auto close { in java
    autocmd FileType java inoremap { {<cr>}<esc>kA

    "Change indent behavior for html
    autocmd FileType html setlocal sw=2 sts=2
    autocmd FileType make setlocal noexpandtab tabstop=8

endif

"Abreviations
abbreviate psvm public static void main
abbreviate sop System.out.println

"goto normal mode by pressing jk 
inoremap jk <esc>

"Use - for end of line
nnoremap - $
nnoremap y- y$
nnoremap d- d$

"insert charater
nnoremap s i_<esc>r
nnoremap S a_<esc>r

"Pressing space in normal mode adds a new line
nnoremap <space> o<esc>
 
nnoremap ; :

"aliases
cnoremap q1 q!

"Yanks to clipboard 
set clipboard=unnamed
set clipboard=unnamedplus

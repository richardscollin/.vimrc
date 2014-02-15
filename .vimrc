"Indentation Stuff
set smartindent
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

set nowrap

"Line number Stuff
"I had these set until I realized how much they can lag vim
"set relativenumber
"set number



if has("autocmd")
    "Curly Brace behavior
    autocmd FileType java,c,javascript inoremap {} {}<left>
    autocmd FileType java,c,javascript inoremap {<cr> {}<left><cr><cr><esc>==kA
    "Java abbreviations
    autocmd FileType java abbreviate psvm public static void main
    autocmd FileType java abbreviate sop System.out.println
    autocmd FileType java noremap <f5> <esc>:w<cr> <esc>:!run %<cr>

    "Change indent behavior for html
    autocmd FileType html setlocal sw=2 sts=2
    autocmd FileType make setlocal noexpandtab tabstop=8

    "Behavior for tex files
    autocmd FileType tex noremap <f5> <esc>:w<cr> <esc>:!pdflatex %<cr>
    autocmd FileType tex noremap <f2> <esc>:call Begin()<cr>i

endif

"Probably could be done better
:function Begin() 
:   call inputsave()
:   let astring = input('value: ')
:   call inputrestore()
:   let command = "normal! i\\begin{".astring."}\r\r\\end{".astring."}"
:   execute command
:   execute "normal! ki\t"
:endfunction

"goto normal mode by pressing jk 
inoremap jk <esc>

"Use - for end of line
nnoremap - $
nnoremap y- y$
nnoremap d- d$

"insert charater works with .
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

"Pressing space in normal mode adds a new line
nnoremap <space> o<esc>
 
"Don't have to press shift
nnoremap ; :

"command mode aliases
cnoremap q1 q!

"Yanks are added to the clipboard.
"Making it possible to paste outside
"of vim. Must have the correct version of vim.
set clipboard=unnamed
set clipboard=unnamedplus

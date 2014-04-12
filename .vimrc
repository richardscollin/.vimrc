set shell=/bin/sh
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

"Speeds up vim
"let loaded_matchparen = 1

"Common mistakes
abbreviate retrun return
abbreviate teh the

"pathogen package manager
execute pathogen#infect()

"eclim settings
filetype plugin indent on
"let &runtimepath = &runtimepath.",~/.vim/eclim/autoload/eclim/android"
let g:SuperTabDefaultCompletionType = 'context'

if has("autocmd")
augroup all
    autocmd!

    "Curly Brace behavior
    autocmd FileType java,c,javascript inoremap {} {}<left>
    autocmd FileType java,c,javascript inoremap {<cr> {}<left><cr><cr><esc>==kA

    "Java settings
    autocmd BufNewFile *.java call Mkjava()
    autocmd FileType java abbreviate psvm public static void main(String[] args)
    autocmd FileType java abbreviate sop System.out.println
    autocmd FileType java noremap <f5> <esc>:w<cr> <esc>:!run %<cr>
    autocmd FileType java let Checkstyle_Classpath = '~/documents/code/java/.checkstyle-5.6-all.jar'
    autocmd FileType java let Checkstyle_XML = '~/documents/code/java/.cs1331-checkstyle.xml'


    "For jcommentor.vim
    autocmd FileType java source ~/.vim/macros/jcommenter.vim 
    autocmd Filetype java let b:jcommenter_class_author='Collin Richards'
    autocmd Filetype java let b:jcommentor_file_author='Collin Richards'
    autocmd Filetype java nnoremap <F2> :call JCommentWriter()<CR>

    "For gas.vim
    autocmd FileType java source ~/.vim/macros/gas.vim
    autocmd FileType java nnoremap <F3> :call Gas() <CR>

    "Change indent behavior for html
    autocmd FileType html setlocal sw=2 sts=2
    autocmd FileType html noremap <f5> <esc>:w<cr> <esc>:!firefox % &<cr>

    "Makefile behavior (currently not working)
    autocmd FileType make setlocal noexpandtab tabstop=8

    "Behavior for tex files
    autocmd FileType tex noremap <f5> <esc>:w<cr> <esc>:!pdflatex %<cr>
    autocmd FileType tex noremap <f2> <esc>:call Begin()<cr>i
    autocmd FileType tex noremap <f3> <esc>i\shortintertext{}<esc>i

augroup END
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

"Generates java boilerplate
:function Mkjava()
:   0r ~/.vim/skeleton/skeleton.java
:   let classname = expand('%:t:r')
:   execute "%s/TODO/".classname."/g"
:endfunction

"goto normal mode by pressing jk 
inoremap jk <esc>

"Use - for end of line
nnoremap - $
onoremap - $

"insert charater s works with .
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

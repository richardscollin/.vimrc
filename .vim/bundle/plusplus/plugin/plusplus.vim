"plusplus.vim 
"Author: Collin Richards <richardscollin@gmail.com>
"Increment all of the numbers on the current line
"and appends the new line after the cursor.
"example
"array[7] = 7;
"into
"array[7] = 7;
"array[8] = 8;

if exists("g:loaded_plusplus")
    finish
endif
let g:loaded_plusplus = 1

let s:save_cpo = &cpo
set cpo&vim

:if !hasmapto('<Plug>Plusplus')
:   map <unique> + <Plug>Plusplus
:endif

nnoremap <Plug>Plusplus+ <esc>:call g:CopyThenInc()<cr>

:function! g:CopyThenInc()
:   let line = getline('.')
:   let inc_line = s:IncrementLine(line)
:   call append('.', inc_line)
:   execute "normal! j0"
:endfunction

:function! s:IncrementLine(line)
:   let split_line = s:SplitOnNumbers(a:line)
:   let result_list = []
:   for word in l:split_line
:       call add(result_list, s:IncNumberIgnoreString(word))
:   endfor
:   return join(result_list,"")
:endfunction

:function! s:SplitOnNumbers(line)
:   let first_list = split(a:line,'\D\+\zs')
:   let result_list = []
:   for part in l:first_list
:       let result_list = l:result_list + split(part,'\d\+\zs')
:   endfor
:   return l:result_list
:endfunction

:function! s:IncNumberIgnoreString(word)
:   let num = str2nr(a:word)
:   let converted_str = string(num)
:   if a:word == l:converted_str
:       return num + 1
:   endif
:   return a:word
:endfunction

let &cpo = s:save_cpo

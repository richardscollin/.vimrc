:function! Gas()
:   execute "normal! \"ayy"
:   let @a = MakeGetterAndSetter(@a)
:   execute "normal! \"ap=}" 
:endfunction 

:function! MakeGetter(type, name)
:    let header = "public ".a:type." get".toupper(a:name[0]).a:name[1:]."() {\n"
:    let tab ="    "
:    let footer = "return ".a:name.";\n}\n"
:    return header.tab.footer
:endfunction

:function! MakeSetter(type, name)
:    let header = "public void set".toupper(a:name[0]).a:name[1:]."(".a:type." ".a:name.") {\n"
:    let tab ="    "
:    let footer = "this.".a:name." = ".a:name.";\n}\n\n"
:    return header.tab.footer
:endfunction

:function! MakeGetterAndSetter(line)
:    if a:line =~ "="
:       let eqidx = stridx(a:line,"=")
:       let line = strpart(a:line, 0, eqidx)
:    else
:       let line = strpart(a:line,0,strlen(a:line)-2)
:    endif
:
:    let tokens = split(line)
:    let name = tokens[-1]
:    let type = tokens[-2]
:
:    return "\n".MakeGetter(type,name).MakeSetter(type,name)
:endfunction

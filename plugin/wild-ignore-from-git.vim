let filename = '.gitignore'
if filereadable(filename)
    let ignorestr = ''
    for oline in readfile(filename)
        let line = substitute(oline, '\s|\n|\r', '', "g")
        if line =~ '^#' | con | endif
        if line == '' | con  | endif
        if line =~ '^!' | con  | endif
        if line =~ '/$' | let ignorestr .= "," . line . "*" | con | endif
        let ignorestr .= "," . line
    endfor
    let execstring = "set wildignore=".substitute(ignorestr, '^,', '', "g")
    execute execstring
endif

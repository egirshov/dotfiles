setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal textwidth=100
setlocal expandtab
setlocal foldmethod=indent
setlocal number

" Remove trailing whitespaces
au BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

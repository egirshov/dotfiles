call helpers#SafeVar("g:anything_run", 1)

" DESC: Disable script loading
if !g:anything_run
    finish
endif

" DESC: Set keys
call helpers#SafeVar("g:anything_run_key",  "<leader>r")
call helpers#SafeVar("g:anything_make_key", "<leader>m")

" DESC: Return preconfigured interpreter name based on given filetype
fun! anything_run#Interp()
    " Typically filetype matches interpreter name.
    " TODO: Scan first line with shebang if possible
    let ft = &filetype
    if ft == "sh" | return "bash"
    elseif ft == "ruby" | return "ruby"
    elseif ft == "python" | return "python"
    elseif ft == "erlang" | return "escript"
    elseif ft == "javascript" | return "node"
    else | return "" | endif
endfunction

" DESC: Save file if it modified and run interpreter
fun! anything_run#Run()
    if &modifiable && &modified | write | endif	
    let interp = anything_run#Interp()
    " Check interpreter installed
    if helpers#CheckProgramm(interp)
        call helpers#ShowPreviewCmd(interp . " " . expand("%:p"))
    endif
endfunction "}}}

" DESC: Save file if it modified and run 'make <file basename>'
fun! anything_run#Make()
    if &modifiable && &modified | write | endif
    call helpers#ShowPreviewCmd("make " . expand("%:t:r"))
endfunction "}}}

nnoremap <leader>r :call anything_run#Run()<CR>
nnoremap <leader>m :call anything_run#Make()<CR>

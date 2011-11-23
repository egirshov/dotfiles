" OPTION: g:pymode_doc -- bool. Show documentation enabled
call helpers#SafeVar("g:anything_run", 1)

" DESC: Disable script loading
if !g:anything_run
    finish
endif

" DESC: Interpreter to execute current file
call helpers#SafeVar("g:interpreter", "")

" Typically filetype matches interpreter name.
autocmd FileType ruby       let g:interpreter="ruby"
autocmd FileType python     let g:interpreter="python"
autocmd FileType erlang     let g:interpreter="escript"

" DESC: Set keys
call helpers#SafeVar("g:anything_run_key", "<leader>r")

" DESC: Check interpreter installed
if !helpers#CheckProgramm(g:interpreter)
    let g:anything_run = 0
    finish
endif

" DESC: Save file if it modified and run interpreter
fun! anything_run#Run() "{{{
    if &modifiable && &modified | write | endif	
    call helpers#ShowPreviewCmd(g:interpreter . " " . expand("%:p"))
endfunction "}}}

nnoremap <leader>r :call anything_run#Run()<CR>

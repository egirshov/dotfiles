set ts=2
set sw=2
set smartindent
set expandtab

" Certain language-specific options
" Note that in case of Python, those will be overriden
" by Python-Mode settings
autocmd filetype python set ts=4
autocmd filetype python set sw=4

set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%\ of\ %L] 
set laststatus=2

if &diff
  syntax off
else
  syntax enable
endif

" Split screen vertically
map <F2> <C-w>v

" TODO: Maybe use some NERDTree feature for that
map <F3> <C-w>v <C-w>w :open .<Enter>

map <F9> :set foldmethod=indent<Enter>
map <Tab> <C-w><C-w>

set pastetoggle=<F4>

filetype plugin on
filetype indent on 

call pathogen#runtime_append_all_bundles()
call pathogen#infect()
" call pathogen#helptags()

let mapleader="\\"
nnoremap <Leader>t :NERDTreeToggle<Enter>
nnoremap ; :

" Use normal regexp in search
" nnoremap / /\v
" vnoremap / /\v

inoremap jj <Esc>

" Misc commands:
" opening/closing folds: zc,zo,zO
" file navigation: gf (go file)

" Python-Mode plugin:

" Set key 'R' for run python code
let g:pymode_run_key = 'R'

" Load show documentation plugin
" let g:pymode_doc = 1
" Key for show python documentation
" let g:pymode_doc_key = 'K'
" Executable command for documentation search
" let g:pydoc = 'pydoc'
"
" Load pylint code plugin
" let g:pymode_lint = 1
" Pylint configuration file
" If file not found use '.pylintrc' from python-mode plugin directory
" let g:pymode_lint_config = "$HOME/.pylintrc"
"
" Disable pylint checking every save
" let g:pymode_lint = 0
" Check code every save
" let g:pymode_lint_write = 1
" Auto open cwindow if errors be finded
" let g:pymode_lint_cwindow = 1
" Place error signs
" let g:pymode_lint_signs = 1

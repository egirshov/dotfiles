set smartindent
set expandtab

set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%\ of\ %L]
set laststatus=2

if &diff
  syntax off
else
  syntax enable
  filetype plugin on
  filetype indent on
endif

" Split screen vertically (also :vsplit or :vs)
map <F2> :vsplit<CR>

" TODO: Maybe use some NERDTree feature for that
map <F3> :vsplit<CR> <C-w>w :open .<CR>
map <Tab> <C-w>w

map <F8> :set foldmethod=indent<Enter>
map <F9> :set foldlevel=10<Enter>

set pastetoggle=<F4>


#call pathogen#incubate()
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
" call pathogen#helptags()

let mapleader="\\"
nnoremap <Leader>t :NERDTree<CR>
nnoremap <Leader>j :JSLintUpdate<CR>
nnoremap <Leader>jj :JSLintToggle<CR>
nnoremap ; :

inoremap jj <Esc>

" Misc commands:
" opening/closing folds: zc,zo,zO
" file navigation: gf (go file)

" Python-Mode plugin:

" Disable pymode
"let g:pymode = 0
"let g:pymode_rope_sorted_completions = 0

" Set a key for runnnig python code
let g:pymode_run_key = 'r'
let g:pymode_lint = 1

"set ignorecase
"set showmatch
"nnoremap * *N

"set incsearch
"set hlsearch
"nnoremap <esc> :noh<return><esc>

" Use normal regexp in search
" nnoremap / /\v
" vnoremap / /\v

" Add plugins:
call plug#begin("~/.vim/plugged")

" Airline is great
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nerd tree!
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git wrapper
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Templating
Plug 'tibabit/vim-templates'

" Helper commands
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-clap'
Plug 'hardcoreplayers/dashboard-nvim'

" Autocomplete
Plug 'ycm-core/YouCompleteMe'

" Linting
Plug 'dense-analysis/ale'

" Better Visual Guide
Plug 'Yggdroot/indentLine'

" Best theme
Plug 'KeitaNakamura/neodark.vim'

" Make tmux stuff easier
Plug 'christoomey/vim-tmux-navigator'

" Language specific processing:
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jmcantrell/vim-virtualenv'
Plug 'cespare/vim-toml'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" This has to go last: 
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Leader macros:
let mapleader = ","

" Airline settings
let g:airline#extensions#ale#enabled = 1

" Ale settings
let g:ale_lint_delay = 450
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_completion_enabled = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 1
let g:ale_python_auto_pipenv = 1
" let g:ale_virtualenv_dir_names = []

let g:ale_fixers = {
    \ '*': [
        \ 'remove_trailing_lines',
        \ 'trim_whitespace',
    \ ],
    \ 'python': [
        \ 'remove_trailing_lines',
        \ 'trim_whitespace',
        \ 'isort',
        \ 'autopep8',
    \ ]
\ }

let g:ale_linters = {
    \ 'python': [
        \ 'mccabe',
        \ 'pylint',
        \ 'flake8',
        \ 'mypy',
        \ 'pyls',
        \ 'pycodestyle',
        \ 'flake8-docstrings',
        \ 'flake8-eradicate',
        \ 'flake8-pep3101',
        \ 'flake8-pytest',
        \ 'flake8-pytest-style',
        \ 'flake8-annotations',
        \ 'flake8-bandit',
        \ 'flake8-functions',
        \ 'flake8-comprehensions',
        \ 'pep8-naming',
    \ ],
    \ 'javascript': [
        \ 'eslint',
    \ ],
\ }
        " \ 'flake8-variables-names',

let g:ale_python_mypy_options = '--ignore-missing-imports'

nmap <silent> <leader>af :ALENext<CR>
nmap <silent> <leader>ab :ALEPrevious<CR>

" Nerd tree settings
nmap <silent> <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['__pycache__', '\.egg-info']

" Setting python version to pyenv setup for it:
let g:python3_host_prog = '/home/vlek/.pyenv/versions/neovim3/bin/python'

set encoding=utf-8
set fileencoding=utf-8
set noswapfile
set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.

set ruler
set number

set secure

set wildmenu
set showmatch

" theme settings
colorscheme neodark
set t_co=256
" if gui, then we can use expanded colors
if has('gui_running')
    set t_co=256
end


set scrolloff=10

set autoindent
set cindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

filetype plugin indent on

" Templating
let g:tmpl_search_paths = ['~/.vim/templates']
let g:tmpl_author_name = "Derek 'Vlek' McCammond"
let g:tmpl_author_email = "dmccammond25@gmail.com"
let g:tmpl_license = "GPLv3"
au BufNewFile,BufRead *.py let IndentStyle = "py"
au BufNewFile *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
au BufNewFile *.awk 0r ~/.vim/templates/awk.skel | let IndentStyle = "awk"
au BufNewFile *.bash 0r ~/.vim/templates/bash.skel | let IndentStyle = "bash"

" Visual bell settings
" This stops WSL/phone noise/buzzing
set bs=2
set noerrorbells
set novisualbell
set tm=500
set t_vb=

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map the keys 'kj' to the Escape key
imap kj <Esc>

" map leader r to run the current file
nmap <silent> <leader>r :w<CR> :!python3 %<CR>
nmap <silent> <leader>t :w<CR> :!pytest<CR>
nmap <silent> <leader><Space> :noh<CR>
nmap <silent> <leader>d :Dashboard<CR>

" Fix some old vi macros:
" Y should yank till the end of line:
" https://www.reddit.com/r/vim/comments/gyr5r1/y_doesnt_copy_to_the_end_of_the_line/
map Y y$

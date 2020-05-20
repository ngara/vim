execute pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible
set undolevels=999
set cpo=aABceFs
set textwidth=0
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set autoindent
set nosmartindent
set copyindent
set ruler
set formatoptions=croql
set backspace=indent,eol,start
set hlsearch
set showmatch                            " show matching brackets
set matchtime=5                          " seconds to blink matching brackets

" Vim 8 -- set terminal to 256 colors
set t_Co=256

" Color Scheme
colorscheme OceanicNext
set background=dark

" settings requiring the latest vim
if version >= 703
  set colorcolumn=80    " highlight the 80th column
  " characters to use for 'specical' characters and non-printables
  " set listchars=nbsp:¶,eol:¬,tab:>-,extends:»,precedes:«,trail:•
  " map <space> to disable highlight easily
  nnoremap <silent><leader><space> :noh<cr>
endif

" inoremap jj <Esc>
nnoremap s :SyntasticCheck Reset<CR>
nnoremap S :SyntasticCheck<CR>

" Statusline "
hi StatusLine ctermbg=white ctermfg=black
set laststatus=2
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
" set statusline+=\ [%{&ff}/%Y]          " filetype
set statusline+=\ [%{getcwd()}]          " current dir
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Right aligned file nav info
set statusline+=%=%-14.(%l,%c%V%)\ [%b\ 0x%02B]\ %p%%
set cmdheight=1

" Highlight Characters past 79th position "
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" Highlight Non-Ascii Characters "
au BufReadPost * syntax match nonascii "[^\u0000-\u007F]"
highlight nonascii guibg=Red ctermbg=red ctermfg=white

hi MatchParen cterm=none ctermbg=blue ctermfg=white
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r
" formatoptions-=o

" Filetypes "
au BufRead,BufNewFile *.ps1 setf ps1
au BufRead,BufNewFile *.pp setf puppet
" au BufRead,BufNewFile *.rb setf ruby
au BufRead,BufNewFile *.applescript setf applescript
au BufRead,BufNewFile *.scpt setf applescript
au BufRead,BufNewFile *.json setf javascript
au BufRead,BufNewFile *.js setf javascript
au BufRead,BufNewFile *.json setf javascript
au BufRead,BufNewFile *.go set filetype=go
au BufNewFile,BufRead Jenkinsfile* set filetype=groovy

au FileType html set indentexpr=

au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

au FileType puppet set shiftwidth=2
au FileType puppet set tabstop=2
au FileType puppet set softtabstop=2

au FileType ruby set shiftwidth=2
au FileType ruby set tabstop=2
au FileType ruby set softtabstop=2

au FileType javascript set shiftwidth=2
au FileType javascript set tabstop=2
au FileType javascript set softtabstop=2

au FileType json set shiftwidth=2
au FileType json set tabstop=2
au FileType json set softtabstop=2

au FileType go set shiftwidth=2
au FileType go set tabstop=2
au FileType go set softtabstop=2

" Perl Section "
" au FileType perl set noexpandtab

" Bash variables
let g:is_bash=1

" Black variables
let g:black_linelength=79
" autocmd BufWritePre *.py execute ':Black'
nnoremap <F9> :Black<CR>

" Syntastic Variables
let g:syntastic_enable_signs=1
"let g:syntastic_quiet_messages={'level': 'warnings'}
let g:syntastic_auto_loc_list=1
"let g:syntastic_puppet_checkers = ["puppetlint"]
"let g:syntastic_ruby_checkers = ["puppetlint"]
"let g:vim_markdown_folding_disabled=1
"let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=["flake8"]  " pylint
let g:syntastic_python_flake8_args="--ignore=E501,E402,E722,W503"
let g:syntastic_python_pylint_args="-d C0111,C0103"
let g:syntastic_eruby_ruby_quiet_messages =
  \ {'regex': 'possibly useless use of a variable in void context'}

let g:syntastic_javascript_checkers = ["jsl"]
let g:syntastic_javascript_jslint_conf="--browser --nomen --indent=2"

let g:syntastic_c_include_dirs = ['lib']
let g:syntastic_cpp_include_dirs = ['lib']

let g:go_version_warning = 0

" Pre-Saved Macros
" @p to convert python2 print to python3 (watch out for multiline prints tho)
let @p = '#/print ^Mlllllr(A)^[<80><fd>a'


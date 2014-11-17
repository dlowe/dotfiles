" pathogen
execute pathogen#infect()
syntax enable
filetype plugin indent on

" solarized colors
set background=dark
colorscheme solarized

" rainbow parentheses
au Syntax clojure RainbowParenthesesToggle

" gitgutter
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

" basic sanity
set nocompatible
set expandtab
set ruler
set showcmd
set number
set showmatch
set incsearch
set hlsearch
set mouse=a

" clojure
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']

nmap <c-c><c-k> :Require<cr>

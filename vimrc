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
set clipboard=unnamed

" clojure
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']

function! TestToplevel() abort
        "Eval the toplevel clojure form (a deftest) and then test-var the
        "result."
        normal! ^
        let line1 = searchpair('(','',')', 'bcrn', g:fireplace#skip)
        let line2 = searchpair('(','',')', 'rn', g:fireplace#skip)
        let expr = join(getline(line1, line2), "\n")
        let var = fireplace#session_eval(expr)
        let result = fireplace#echo_session_eval("(clojure.test/test-var " .  var .  ")")
        return result
endfunction

nmap <c-c>, :<c-u>call TestToplevel()<cr>
nmap <c-c><c-k> :Require<cr>

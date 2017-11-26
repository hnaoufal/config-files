" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

set nocompatible
syntax on
set nowrap
set encoding=utf8
set number
set ruler
set laststatus=2
set mouse=a
set expandtab
set shiftwidth=2
set softtabstop=2

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'shougo/deoplete.nvim'
Plug 'neovim/node-host', { 'do': 'npm install -g neovim' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'moll/vim-node'
Plug 'yggdroot/indentline'
Plug 'mklabs/mdn.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'ap/vim-css-color'
Plug 'raimondi/delimitmate'
Plug 'kien/rainbow_parentheses.vim'

" Initialize plugin system
call plug#end()

" Start deoplete on startup
let g:deoplete#enable_at_startup = 1

" flow
let g:javascript_plugin_flow = 1

"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]

" jsx in js files
let g:jsx_ext_required = 0

" indentLine
let g:indentLine_setColors = 1
let g:indentLine_bgcolor_gui= '#002b36'

" delimate newline and cr
let delimitMate_expand_cr=1

" let g:indentLine_color_gui= '#586E75' much lighter
let g:indentLine_color_gui= '#073642'
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_faster = 1
let g:airline_powerline_fonts = 1

" Ale Listers

let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_sign_column_always = 1

let g:ale_sign_error = '⚡ '
let g:ale_sign_warning = '⚠ '
let g:ale_statusline_format = ['{%d}', '{%d}', '']
let g:ale_change_sign_column_color= 0
let g:airline#extensions#ale#enabled = 1
let g:ale_javascript_eslint_use_global = 1

" extras
let g:ale_lint_delay = get(g:, 'ale_lint_delay', 200)
call ale#Set('change_sign_column_color', 0)
let g:ale_set_highlights = get(g:, 'ale_set_highlights', 0)

" Put this in vimrc or a plugin file of your own.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_global = 1

" Rainbow paranthese

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


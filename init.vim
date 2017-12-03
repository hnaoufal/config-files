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
set autoread
set termguicolors
set guifont=MesloLGSDZ\ Nerd\ Font\ Mono\ RegularForPowerline\ 11

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-sensible'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'alvan/vim-closetag'
Plug 'iCyMind/NeoSolarized'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf'
Plug 'wavded/vim-stylus'
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'ludovicchabant/vim-gutentags'
Plug 'w0rp/ale'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'shougo/deoplete.nvim'
Plug 'neovim/node-host', { 'do': 'npm install -g neovim' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'SirVer/ultisnips'
Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }
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
Plug 'ryanoasis/vim-devicons'

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

" Colors
" default value is "normal", Setting this option to "high" or "low" does use the 
" same Solarized palette but simply shifts some values up or down in order to 
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed 
" using ":set list" can be set to one of three levels depending on your needs. 
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized 
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:  
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0

set background=dark
colorscheme NeoSolarized

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

autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))


" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsSnippetDirectories=['~/UltiSnips/', 'UltiSnips']

" close tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

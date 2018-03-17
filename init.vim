" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

syntax on
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif " has("autocmd")

if &compatible
  set nocompatible
endif

silent! while 0
  set nocompatible
silent! endwhile

set history=200		" keep 200 lines of command line history
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
set synmaxcol=200
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line
" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-sensible'
Plug 'wakatime/vim-wakatime'
Plug 'itchyny/vim-cursorword'
Plug 'yuttie/comfortable-motion.vim'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'alvan/vim-closetag'
Plug 'iCyMind/NeoSolarized'
Plug 'shime/vim-livedown'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'shougo/deoplete.nvim'
Plug 'neovim/node-host', { 'do': 'npm install -g neovim' }
Plug 'SirVer/ultisnips'
" Plug 'epilande/vim-react-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'yggdroot/indentline'
Plug 'mklabs/mdn.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'raimondi/delimitmate'
Plug 'kien/rainbow_parentheses.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'chrisbra/colorizer'
Plug 'lepture/vim-css'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

Plug 'moll/vim-node'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'jiangmiao/auto-pairs',     { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
" Plug 'flowtype/vim-flow'
 Plug 'steelsojka/deoplete-flow'


" Initialize plugin system
call plug#end()

" Start deoplete on startup
let g:deoplete#enable_at_startup = 1

" flow
" let g:javascript_plugin_flow = 0

"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ 'js',
                \ '...'
                \ ]

" jsx in js files
let g:jsx_ext_required = 0

" indentLine
let g:indentLine_setColors = 1
let g:indentLine_bgcolor_gui= '#002b36'

" let g:indentLine_color_gui= '#586E75' much lighter
let g:indentLine_color_gui= '#073642'
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_faster = 1
let g:airline_powerline_fonts = 1

" Write this in your vimrc file
" let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0

" Ale Listers

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'stylus': ['stylelint'],
\}
let g:ale_sign_column_always = 1

let g:ale_sign_error = '⚡'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['{%d}', '{%d}', '']
let g:ale_change_sign_column_color= 0
let g:airline#extensions#ale#enabled = 1
"let g:ale_javascript_eslint_use_global = 1
"let g:ale_javascript_flow_use_global = 1
let g:ale_javascript_eslint_use_local_config = 1

" extras
let g:ale_lint_delay = get(g:, 'ale_lint_delay', 200)
call ale#Set('change_sign_column_color', 0)
let g:ale_set_highlights = get(g:, 'ale_set_highlights', 0)

" Put this in vimrc or a plugin file of your own.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_javascript_eslint_use_local_config = 1

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1
"let g:ale_javascript_eslint_use_global = 1

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

" activate element under the cursor
"autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))


" Ultisnips
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-z>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

set runtimepath+=~/.vim/
let g:UltiSnipsSnippetsDir="~/.vim/myUltiSnips"
let g:UltiSnipsSnippetDirectories= ["myUltiSnips"]

" close tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Set the current Directory to active Buffer/File (for File-Comp)
" autocmd BufEnter * silent! lcd %:p:h
"
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
nnoremap <silent> <C-j> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 1)<CR>
nnoremap <silent> <C-k> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

" Filetypes
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
autocmd Filetype json let g:indentLine_setConceal=0
autocmd Filetype json setlocal conceallevel=0

" Easy-Motion configuration
"s substitute single character with new text	text, ESC
"t same as "f" but cursor moves to just before found character	character to find" override the follwing standard vim behaivour

let g:EasyMotion_smartcase = 1
nmap t <Plug>(easymotion-t2)

map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

nmap s <Plug>(easymotion-overwin-f2)

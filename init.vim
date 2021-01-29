" (Neo)Vim Configuration
" By Abel Aebker and Daniel Miessler and Kana the Wizard
" January 2021

" PATHOGEN INSTALL

execute pathogen#infect()

" BASIC CONFIGURATION

syntax on	" syntax highlighting
set linebreak
set showmatch
set hlsearch	" highlight all search results
set incsearch	" show incremental search results as you type
set number	" display line number
set noswapfile	" disable swap file
"let mapleader = '"'	" remap the leader to ''', right next to ';'
inoremap jk <ESC>	" remap escape to "jk"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set breakindent

" COLOR

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more
"information.)

if (empty($TMUX))
	if (has("nvim"))
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	if (has("termguicolors"))
		set termguicolors
	endif
endif

let g:onedark_terminal_italics=1

let g:airline_theme='onedark'
colorscheme onedark

"Ultisnips Config

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"delimitMate Config

let delimitMate_smart_matchpairs = '^\%(\w\|\!\|[£]\|[^[:punct:][:space:]]\)'

"TeX Config

let g:tex_indent_brace = 0

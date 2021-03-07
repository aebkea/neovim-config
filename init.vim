" (Neo)Vim Configuration
" By Abel Aebker and Daniel Miessler and Kana the Wizard
" January 2021

" PATHOGEN INSTALL

execute pathogen#infect()

" BASIC CONFIGURATION

syntax on	" syntax highlighting
set linebreak
set showmatch
set nohlsearch	" highlight all search results
set incsearch	" show incremental search results as you type
set number	" display line number
set noswapfile	" disable swap file
let mapleader = ','	" remap the leader to comma
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

"EasyMotion

" map <SPACE> <Plug>(easymotion-s2)

"coc.vim

"--TextEdit might fail if hidden is not set.
set hidden

"--Some servers have issues with backup files
set nobackup
set nowritebackup

"--Give more space for displaying messages.
set cmdheight=2

"--Having longer updatetime (default is 4000ms) leads to noticeable
"--delays and poor use experience.
set updatetime=300

"--Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"--Always show the signcolumn, otherwise it would shift the text each time
"--diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

"--Use <c-space> to trigger completion list.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

"--Autocomplete on <leader>-l
inoremap <silent><expr> <leader>l pumvisible() ? coc#_select_confirm() :
			\ "\<C-g>u\<leader>l"

"coc-snippets

"imap <tab> <Plug>(coc-snippets-expand-jump)

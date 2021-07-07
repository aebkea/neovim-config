" (Neo)Vim Configuration
" By Abel Aebker and Daniel Miessler and Kana the Wizard
" January 2021

" PATHOGEN INSTALL

" execute pathogen#infect()

" VIM-PLUG INSTALL

call plug#begin('~/.config/nvim/plugged')

Plug 'rafi/awesome-vim-colorschemes'
Plug 'sirver/ultisnips'
Plug 'psliwka/vim-smoothie'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'micha/vim-colors-solarized'
Plug 'lervag/vimtex'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

call plug#end()

" Lsp-Install

lua <<EOF
require'lspinstall'.setup()

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
	require'lspconfig'[server].setup{}
end
EOF

" TREESITTER CONFIG

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

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

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.whitespace = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='sonokai'
colorscheme sonokai

"Ultisnips Config

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"delimitMate Config

" let delimitMate_smart_matchpairs = '^\%(\w\|\!\|[£]\|[^[:punct:][:space:]]\)'

"TeX Config

let g:tex_indent_brace = 0
let g:vimtex_view_enabled = 0
let g:vimtex_syntax_enabled = 0
let g:vimtex_complete_enabled = 0

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
" set shortmess+=c

" "--Always show the signcolumn, otherwise it would shift the text each time
" "--diagnostics appear/become resolved.
" if has("patch-8.1.1564")
" 	" Recently vim can merge signcolumn and number column into one
" 	set signcolumn=number
" else
" 	set signcolumn=yes
" endif

" "--Use <c-space> to trigger completion list.
" if has('nvim')
" 	inoremap <silent><expr> <c-space> coc#refresh()
" else
" 	inoremap <silent><expr> <c-@> coc#refresh()
" endif
" 
" "--Autocomplete on <leader>-l
" inoremap <silent><expr> <leader>l pumvisible() ? coc#_select_confirm() :
" 			\ "\<C-g>u\<leader>l"

"coc-snippets

"imap <tab> <Plug>(coc-snippets-expand-jump)

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

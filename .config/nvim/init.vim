" Plugins {{{
" --------------------------------------

call plug#begin()

" common deps
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" color scheme
Plug 'folke/tokyonight.nvim'

" auto-detect indentation
Plug 'tpope/vim-sleuth'
" git
Plug 'tpope/vim-fugitive'
" quotes/brackets
Plug 'tpope/vim-surround'

" powerline
Plug 'nvim-lualine/lualine.nvim'
"
" bufferline
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" comments
Plug 'terrortylor/nvim-comment'

" syntax parsing
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope.nvim'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'L3MON4D3/LuaSnip'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'b0o/SchemaStore.nvim'

" Tree view
Plug 'kyazdani42/nvim-tree.lua'

" Terminal
Plug 'akinsho/toggleterm.nvim', { 'tag': 'v1.*' }

" Cosmic ui
Plug 'MunifTanjim/nui.nvim'
Plug 'CosmicNvim/cosmic-ui'

call plug#end()
"}}}


" Settings {{{
" --------------------------------------

" change <leader> to comma
let mapleader=','

set tabstop=4           " tab width
set shiftwidth=0        " indent width for >>, <<, etc. (0=tabstop)
set softtabstop=-1      " soft tab width (negative=shiftwidth)
set expandtab           " use spaces for indenting
set autoindent          " copy indent from current line when starting a new line
set smartindent         " make indent smarter
set copyindent          " copy the previous indentation on auto-indenting
set colorcolumn=80      " line at column 80
set textwidth=80        " for line wrapping with `gq`

set nowrap              " do not wrap long lines
set sidescroll=1        " scroll long lines by 1 char
set sidescrolloff=10    " horizontal scroll context
set scrolloff=2         " vertical scroll context
set virtualedit=block   " cursor can be positioned anywhere in V-Block mode

set number              " show line number
set nocursorline        " don't highlight cursor line
set nocursorcolumn      " don't highlight cursor column
set relativenumber      " use relative line numbers (relative to the current)
" always display line gutter (to prevent screen jumping on linter errors
set signcolumn=yes

set hlsearch            " highlight all search matches
set incsearch           " show found patters during typing
set ignorecase          " ignore case when searching
set smartcase           " ignore case if pattern is all lowercase
set wrapscan            " searching wraps around the end of the file

set history=50          " keep 50 lines of command line history
set synmaxcol=200       " maximum column in which to search for syntax items

set foldcolumn=0        " display gutter line with folding areas
set foldmethod=indent   " automatically fold by indent level
set foldlevelstart=99   " make all folds open by default

set modeline            " support modeline comments (like vim: tw=8 noet:)
set autoread            " reload file after it has been changed outside

set list                " show whitespaces
set listchars=eol:\ ,tab:╶─,trail:·,extends:…,precedes:…,nbsp:• "↙
set breakindent         " wrapped lines are indented
set showbreak=…\        " display '… ' at the beginning of wrapped lines
set breakindentopt=min:20,shift:0,sbr
set fillchars=fold:\    " use ' ' for fold lines instead of more intrusive '-'

" format options
" t - auto-wrap text
" c - auto-wrap comments
" r - insert comment leader on <Enter>
" o - insert comment leader on 'o' or 'O'
" q - comments formatting with 'gq'
" a - auto-format paragraphs (disabled)
" n - recognize number lists
" l - don't break already long lines in insert mode
" 1 - don't break line after one-letter word
" j - smart comments joining
set formatoptions=tcroqnl1j
set nojoinspaces        " do not insert 2 spaces after '.', '?', and '!' with a join command


set wildchar=<Tab>
set wildmenu
set wildmode=longest:full
set wildignore=""
set wildignorecase

set termguicolors
set background=light
colorscheme tokyonight

" use "+ register by default
set clipboard^=unnamedplus
set noshowcmd
set noshowmode
set mouse=a             " enable mouse
set laststatus=2        " always display status line
set spell               " spell checking
set completeopt=menu,menuone,noselect

" set guicursor=

" K invokes this command for the word under cursor
autocmd FileType vim setlocal keywordprg=:help

"}}}

" Functions {{{
" --------------------------------------
function! IsWSL()
  if has("unix")
    let lines = readfile("/proc/version")
    if lines[0] =~ "Microsoft"
      return 1
    endif
  endif
  return 0
endfunction

function! ToggleWhiteSpaceIgnore()
  if &diffopt =~ 'iwhite'
    set diffopt-=iwhite
  else
    set diffopt+=iwhite
  endif
endfunction

"}}}

" Commands {{{
" --------------------------------------
command Vimrc :e ~/.config/nvim/init.vim
command R :so ~/.config/nvim/init.vim

"}}}

" Mappings {{{
" --------------------------------------
nnoremap ; :
" ; and , - next and prev character for f and t
nnoremap <Space> ;
nnoremap <C-Space> ,

imap jj <esc>
cmap jj <esc>

" Turn off highlight search
nmap <silent> <leader>n :nohls<CR>

nmap Y yy

" shortcut for "very magic" patterns
nnoremap <A-/> /\v

" more natural navigation on wrapped lines
nnoremap j gj
nnoremap k gk

" window resize
noremap <silent> <C-F9>  :vertical resize -3<CR>
noremap <silent> <C-F10> :resize +3<CR>
noremap <silent> <C-F11> :resize -3<CR>
noremap <silent> <C-F12> :vertical resize +3<CR>
noremap <silent> <C-S-F9>  :vertical resize -1<CR>
noremap <silent> <C-S-F10> :resize +1<CR>
noremap <silent> <C-S-F11> :resize -1<CR>
noremap <silent> <C-S-F12> :vertical resize +1<CR>

" toggle wrapping
nmap <silent> <leader>w :setlocal wrap!<CR>

" add ; or , at the end of the line
nmap <silent> <leader>; msA;<esc>`s:delmarks s<CR>
nnoremap <silent> <leader>, msA,<esc>`s:delmarks s<CR>

" buffer commands
nmap <silent> <leader>bd :bdelete<CR>
nmap <silent> <leader>bn :bnext<CR>
nmap <silent> <C-w>] :bnext<CR>
nmap <silent> <leader>bp :bprevious<CR>
nmap <silent> <C-w>[ :bprevious<CR>

" 'le' is short for location expand (lo with comma leader is not easy)
nmap <silent> <leader>le :lopen<CR>
nmap <silent> <leader>lc :lclose<CR>

nmap <silent> <leader>pc :pclose<CR>

" jump to the first non-blank character of the line
nmap 0 ^

" copy file info to clipboard:
" <leader>yf - relative filepath and linenumber
" <leader>yp - full filepath
" <leader>yn - file name only
nmap <silent> <leader>yf :let @+ = expand("%") . ":" . line(".")<CR>
nmap <silent> <leader>yp :let @+ = expand("%:p")<CR>
nmap <silent> <leader>yn :let @+ = expand("%:t")<CR>

nmap <silent> <leader>i :call ToggleWhiteSpaceIgnore()<CR>
nmap <leader>dt :diffthis<CR>
nmap <leader>do :diffoff<CR>

"}}}

" Plugins config {{{
" --------------------------------------

" neosolarized config
" hi SignColumn ctermbg=7 ctermfg=11 guibg=#eee8d5 guifg=#657b83
" hi DiagnosticError ctermfg=1 guifg=#dc322f
" hi DiagnosticSignError ctermbg=7 ctermfg=1 guibg=#eee8d5 guifg=#dc322f
" hi DiagnosticWarn ctermfg=3 guifg=#b58900
" hi DiagnosticSignWarn ctermbg=7 ctermfg=3 guibg=#eee8d5 guifg=#b58900
" hi DiagnosticInfo ctermfg=4 guifg=#268bd2
" hi DiagnosticSignInfo ctermbg=7 ctermfg=4 guibg=#eee8d5 guifg=#268bd2
" hi DiagnosticHint ctermfg=2 guifg=#859900
" hi DiagnosticSignHint ctermbg=7 ctermfg=2 guibg=#eee8d5 guifg=#859900
     
sign define DiagnosticSignError text= texthl=DiagnosticSignError
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint

" fugitive
nmap <leader>gs :Git<CR>
nmap <leader>gb :Gtt blame<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Gllog<CR>

" nvim-tree
nmap <leader>t :NvimTreeToggle<CR>
nmap <leader>r :NvimTreeFindFile<CR>

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').highlights()<cr>

lua << EOF
require('init');
EOF


"}}}

" vim: foldmethod=marker foldlevel=1 ts=2 sw=2:

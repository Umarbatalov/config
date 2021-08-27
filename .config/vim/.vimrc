syntax enable

" Flash screen instead of beep sound
set visualbell

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

filetype plugin indent on

set backspace=indent,eol,start

set nocompatible
set nobackup
set nowritebackup
set noswapfile
set hlsearch
set incsearch
set backspace=2

set mouse=a
set ttymouse=sgr
set updatetime=500
set balloondelay=250
set signcolumn=yes

set autoindent
set smartindent

map <C-Up> <C-w>k
map <C-Right> <C-w>l
map <C-Down> <C-w>j
map <C-Left> <C-w>h

""""""""""""""""""""Plugins"""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

"common
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'

"git
Plug 'airblade/vim-gitgutter'

"Window customize
Plug 'vim-airline/vim-airline'

"Rust
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

"Toml
Plug 'cespare/vim-toml'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline

" air-line plugin specific commands
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Rust lsp
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_fold_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0

nnoremap <C-i> :LspDefinition<Cr>

execute "set <M-l>=\el"
nnoremap <M-l> :LspDocumentFormat<Cr>

" fzf setup
let g:fzf_layout = { 'down': '~23%' }
nnoremap <C-n> :Files<Cr>
nnoremap <S-Tab> :Buffers<Cr>

" Rg search
nnoremap <C-f> :Rg<Cr>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" NERDTreeToggle
map <S-n> :NERDTreeToggle<CR>
au VimEnter *  NERDTree

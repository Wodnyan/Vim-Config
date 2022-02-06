syntax on
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nonu
set nu
set rnu
set nowrap
" set wrap
set encoding=UTF-8 
set guicursor=
" set nohlsearch
set signcolumn=yes
set scrolloff=8

" :set guicursor=a:hor20-Cursor

filetype plugin on

map <Space> <Leader>

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'kien/ctrlp.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'pangloss/vim-javascript'    " JavaScript support
" Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'posva/vim-vue'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'pantharshit00/vim-prisma'
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
" Plug 'jiangmiao/auto-pairs'
Plug 'tomasiser/vim-code-dark'
Plug 'mattn/emmet-vim'
Plug 'jparise/vim-graphql'
" Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim' 

call plug#end()

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <leader>.  <Plug>(coc-codeaction)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-pyright', 'coc-omnisharp' ]

nmap <C-n> :NERDTreeToggle<CR>

let g:airline#extensions#tabline#enabled = 1
let g:gitgutter_terminal_reports_focus=0
set updatetime=200

set t_Co=256
set t_ut=
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" colorscheme gruvbox
colorscheme onedark
" colorscheme nord
" colorscheme iceberg
" colorscheme codedark
" let g:airline_theme = 'codedark'
" let g:airline_theme = 'gruvbox'

" colorscheme default

:set bg=dark
" :set bg=light

" set wrap linebreak nolist

" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" hi Normal guibg=NONE ctermbg=NONE

" Nerd tree size
:let g:NERDTreeWinSize=40

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:ctrlp_use_caching = 0

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCompactSexyComs = 1

map <c-h> :bprevious<CR> 
map <c-l> :bnext<CR>
nmap <silent> gd <Plug>(coc-definition)

:tnoremap <Esc> <C-\><C-n>

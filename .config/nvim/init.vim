" vim-plug
call plug#begin('~/.vim/plugged')

" Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" lightline
Plug 'itchyny/lightline.vim'

" NERD TREE
Plug 'scrooloose/nerdtree'

" git
Plug 'airblade/vim-gitgutter'

" prettier
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" open tree automaitcally if directory is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" javascript
Plug 'pangloss/vim-javascript'

" Themes
Plug 'kaicataldo/material.vim'

call plug#end()

" Enable full color support in terminals
set termguicolors
set guifont=Operator\ Mono\ Light
set background=dark
colorscheme material
let g:material_terminal_italics = 1
let g:lightline = { 'colorscheme': 'material_vim' }

" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0

" Running before saving async
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

set number     " Show line numbers in the gutter
set expandtab  " Insert spaces when TAB is pressed
set tabstop=2  " Render TABs using this many spaces
set ignorecase " Make searching case insensitive
set smartcase  " ... unless the query has capital letters

" Use <C-L> to clear the highlighting of :set hlsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

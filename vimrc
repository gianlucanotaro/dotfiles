" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'hecal3/vim-leader-guide'
NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mkitt/tabline.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'valloric/youcompleteme'
NeoBundle 'xuhdev/singlecompile'
NeoBundle 'xuyuanp/nerdtree-git-plugin'
NeoBundle 'mhinz/vim-startify'
" My Bundles here:
"
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
syntax on
set number relativenumber
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Move Tabs arround
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let mapleader = " "
map <leader>n :NERDTreeTabsToggle<enter>
map <leader>t :TagbarToggle<enter>
"Quick Exits
map <leader>a :wq!<enter>
map <leader>q :q!<enter>
map <leader>s :w!<enter>
"SCCompile
nmap <C-F9> :SCCompile<cr>
nmap <C-F10> :SCCompileRun<cr>"

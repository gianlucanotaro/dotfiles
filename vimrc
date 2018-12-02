" Note: Skip initialization for vim-tiny or vim-small.
" 
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
NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'
NeoBundle 'jreybert/vimagit'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'mkitt/tabline.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'xuyuanp/nerdtree-git-plugin'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'hecal3/vim-leader-guide'
NeoBundle 'vim-scripts/SingleCompile'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'zchee/deoplete-clang'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'mbbill/undotree'
NeoBundle 'junegunn/gv.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'dracula/vim'
NeoBundle 'arcticicestudio/nord-vim'
NeoBundle 'junegunn/goyo.vim'
" My Bundles here:
"
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()
syntax on
color dracula

" Required:
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
syntax on
let mapleader = " "
set number relativenumber
set completeopt=menu,noinsert
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" deoplete + neosnippet + autopairs
let g:AutoPairsMapCR=1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:AutoPairsFlyMode = 0
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
let g:typndentLine_char = 'c'
inoremap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
let g:indentLine_enabled = 1

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Move lines
nnoremap <a-j> :m .+1<CR>==
nnoremap <a-k> :m .-2<CR>==
inoremap <a-j> <Esc>:m .+1<CR>==gi
inoremap <a-k> <Esc>:m .-2<CR>==gi
vnoremap <a-j> :m '>+1<CR>gv=gv
vnoremap <a-k> :m '<-2<CR>gv=gv


"Move Tabs arround
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR> nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

"Brackets autocompletion
" Enable folding
set foldmethod=indent
set foldlevel=99


"Quick Exits
"SCCompile

" Define prefix dictionary
let g:lmap =  {}
map <leader>q :q!<enter>
let g:lmap.q = ['q', 'Quit']
map <leader>s :w!<enter>
let g:lmap.s = ['s', 'Save']
nmap <leader>f :Goyo<CR>
let g:lmap.f = ['m', 'Toggle Goyo mode']
nmap <leader>a :wq!<enter>
let g:lmap.a = ['wq!', 'Save and quit']
nmap <leader>p :SCCompile<cr>
let g:lmap.p = ['SCCompile', 'Compile']
nmap <leader>o = :SCCompileRun<cr>
let g:lmap.o = ['SCCompileRun', 'Run']
nmap <leader>go :MagitOnly<cr>
nmap <leader>gg :Magit<cr>
let g:lmap.g = {
	    \'name' : 'Git',
	        \'o' : ['MagitOnly', 'Magit Only'],
	        \'g' : ['Magit', 'Magit',] 
                \}

map <leader>wu :UndotreeToggle<enter>
let g:lmap.w = {
        \'name' : 'Windows',
            \'n' : ['NERDTreeToggle', 'Toggle Nerd Tree'],
            \'t' : ['TagbarToggle',   'Toggle Tagbar'],
            \'u' : ['UndotreeToggle', 'Toggle Undotree'],
                \}

" Define some descriptions
" The Descriptions for other mappings defined by NerdCommenter, will default
" to their respective commands.
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

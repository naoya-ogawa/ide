"######ショートカット設定######
nnoremap <f2> :NERDTreeToggle<CR>
"nnoremap <f2> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
nnoremap <f3> :source ~/.vimrc<CR>

nmap <F8> :TagbarToggle<CR>

imap <c-j> <esc>
imap <c-k> <CR>
imap <c-h> <bs>

cnoremap <c-k> <CR>
cnoremap <c-h> <bs>

"キーの入替え
nnoremap ; :
nnoremap : ;

"実行キーの切替
nnoremap s :!

"ウィンドウ移動
nnoremap <space>w <c-w>w
nnoremap <space>j <c-w>j
nnoremap <space>k <c-w>k
nnoremap <space>i <c-w>i
nnoremap <space>l <c-w>l


"Shift+2
nnoremap " :VimFiler<CR>
"Shift+3
nnoremap # :source ~/.vimrc<CR>
"Shift+5
nnoremap % :lcd %:h<CR>:! go test 
"Shift+7
nnoremap ' :UniteBookmarkAdd<CR>
"Shift+8
nnoremap ( :Unite bookmark<CR>

" lhs comments
vmap ,# :s/^/#/<CR>:nohlsearch<CR>
vmap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap ,> :s/^/> /<CR>:nohlsearch<CR>
vmap ," :s/^/\"/<CR>:nohlsearch<CR>
vmap ,% :s/^/%/<CR>:nohlsearch<CR>
vmap ,! :s/^/!/<CR>:nohlsearch<CR>
vmap ,; :s/^/;/<CR>:nohlsearch<CR>
vmap ,- :s/^/--/<CR>:nohlsearch<CR>
vmap ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

"####オムニ補完#######
inoremap <c-a> <c-x><c-o>

set lines=35
set columns=150

let g:vimfiler_enable_auto_cd = 1
let NERDTreeChDirMode=2


"######表示設定#######
if !has('wind32')
    set encoding=utf-8 " エンコ固定
endif
set number "行番号表示
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set smartindent "オートインデント

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

"####自動改行無効###
:setlocal formatoptions-=r
:setlocal formatoptions-=o

"#####検索設定######
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで言ったら最初に戻る

"###############################################
"#  golang
"###############################################
if $GOROOT != ''

    filetype off
    filetype plugin indent off
    set runtimepath+=$GOROOT/misc/vim
    filetype plugin indent on
    syntax on
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    au FileType go setlocal sw=4 ts=4 sts=4 noet
    " :make :copen の設定
    au FileType go setlocal makeprg=go\ build\ ./... errorformat=%f:%l:\ %m
    
    exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
    set completeopt=menu,preview

endif

"###############################################
"   plugin
"###############################################
"# neobundle
set nocompatible
filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif 

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'

NeoBundleLazy 'Blackrush/vim-gocode', {"autoload": {"filetypes": ['go']}}
NeoBundle 'Shougo/vimfiler'
NeoBundle 'dgryski/vim-godef'
NeoBundle 'majutsushi/tagbar'
if !has('win32')
    NeoBundle 'Shougo/vimproc', {
                \ 'build' : {
                \ 'windows' : 'make -f make_mingw32.mak',
                \ 'cygwin' : 'make -f make_cygwin.mak',
                \ 'mac' : 'make -f make_mac.mak',
                \ 'unix' : 'make -f make_unix.mak',
                \ },
                \ }
endif

NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'


filetype plugin indent on

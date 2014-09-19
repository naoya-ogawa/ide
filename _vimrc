"######ショートカット設定######
"nnoremap <f2> :NERDTreeToggle<CR>
nnoremap <f2> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
nnoremap <f3> :source ~/.vimrc<CR>
noremap <CR> o<ESC>
noremap <c-j> :!
nmap <F8> :TagbarToggle<CR>

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



"####オムニ補完#######
inoremap <c-a> <c-x><c-o>

set lines=35
set columns=150

let g:vimfiler_enable_auto_cd = 1

"######表示設定#######
set encoding=utf-8 " エンコ固定
set number "行番号表示
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set smartindent "オートインデント

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

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

"NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'

NeoBundleLazy 'Blackrush/vim-gocode', {"autoload": {"filetypes": ['go']}}
NeoBundle 'Shougo/vimfiler'
NeoBundle 'dgryski/vim-godef'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }




filetype plugin indent on

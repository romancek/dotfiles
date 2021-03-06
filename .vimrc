set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set nocompatible
filetype off

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'
" less用のsyntaxハイライト
NeoBundle 'KohPoll/vim-less'
" colorscheme molokai
NeoBundle 'tomasr/molokai'
" Python補完機能
" NeoBundleLazy "davidhalter/jedi-vim", {
"             \ "autoload":{
"             \   "filetypes": ["python", "python3"],
"             \ },
"             \ "build": {
"            \   "mac": "pip install jedi",
"             \   "unix": "pip install jedi",
"             \ }}
"
" let s:hooks = neobundle#get_hooks("jedi-vim")

call neobundle#end()

" Required:
filetype plugin indent on
syntax enable
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""

" タグファイルの指定(でもタグジャンプは使ったことがない)
set tags=~/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バックアップしない
set nowritebackup
set nobackup
set noswapfile
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=4
" Vimが挿入するインデントの幅
set shiftwidth=4
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" バックスペースを有効にする
set backspace=indent,eol,start

set expandtab

" colorscheme
colorscheme molokai

let g:molokai_original=1
let g:rehash256=1
"set background=light
set background=dark
" 行番号の色
highlight LineNr ctermfg=grey

" indent guides
let g:indent_guides_auto_colors=0
let g:indent_guides_start_level=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGUidesOdd ctermbg=233
let g:indent_guides_guide_size = &tabstop
" Vim起動時にIndent Guidesを有効にする
au VimEnter * IndentGuidesEnable

""""""""""""""""""""""""""""""

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
"
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
"""""""""""""""""""""""""""""""
"" Unit.vimの設定
"""""""""""""""""""""""""""""""
"" 入力モードで開始する
let g:unite_enable_start_insert=1
"" バッファ一覧
noremap <C-P> :Unite buffer<CR>
"" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
"" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
"" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
"" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"""""""""""""""""""""""""""""""
"" http://inari.hatenablog.com/entry/2014/05/05/231307
"""""""""""""""""""""""""""""""
"" 全角スペースの表示
"""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
"""""""""""""""""""""""""""""""
"
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
"""""""""""""""""""""""""""""""
"" 挿入モード時、ステータスラインの色を変更
"""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
"
if has('syntax')
    augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
    if a:mode == 'Enter'
        silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
        silent exec g:hi_insert
        else
        highlight clear StatusLine
        silent exec s:slhlcmd
    endif
endfunction

function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
    return hl
endfunction
"""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
"" 最後のカーソル位置を復元する
"""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \ exe "normal! g'\"" |
    \ endif
endif
"""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
"" 自動的に閉じ括弧を入力
"""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
"""""""""""""""""""""""""""""""

" function! s:hooks.on_source(bundle)
"     " jediにvimの設定を任せると'completeopt+=preview'するので
"     " 自動設定機能をOFFにし手動で設定を行う
"     let g:jedi#auto_vim_configuration = 0
"     " 補完の最初の項目が選択された状態だと使いにくいためオフにする
"     let g:jedi#popup_select_first = 0
"     autocmd FileType python setlocal completeopt-=preview
" endfunction


filetype on



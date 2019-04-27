#!/bin/bash

"" setting
"" 文字コードをUFT-8に設定
set fenc=utf-8
"" バックアップファイルを作らない
set nobackup
"" スワップファイルを作らない
set noswapfile
"" 編集中のファイルが変更されたら自動で読み直す
set autoread
"" バッファが編集中でもその他のファイルを開けるように
set hidden
"" 入力中のコマンドをステータスに表示する
set showcmd


"" 見た目系
"" 行番号を表示
set number
"" 現在の行を強調表示
set cursorline
"" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
"" インデントはスマートインデント
set smartindent
"" ビープ音を可視化
set visualbell
"" 括弧入力時の対応する括弧を表示
set showmatch
"" ステータスラインを常に表示
set laststatus=2
"" コマンドラインの補完
set wildmode=list:longest
"" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


"" Tab系
"" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-,trail:.
"" Tab文字を半角スペースにする
set expandtab
"" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
"" 行頭でのTab文字の表示幅
set shiftwidth=2
"" 改行時に前の行のインデントを継続する
set autoindent

"" 検索系
"" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
"" 検索時に最後まで行ったら最初に戻る
set wrapscan
"" 検索語をハイライト表示
set hlsearch
"" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"" 全角スペースの可視化
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

"" molokai のビジュアルモードが見辛いので色を変える
autocmd colorscheme molokai highlight Visual ctermbg=8

colorscheme molokai
syntax on

"" On/Off visualize Tab and Tab2Space, Number
nnoremap <C-k> :set list!<CR>
nnoremap <C-l> :set list listchars=tab:\▸\-,trail:.<CR>
nnoremap <Space>n :set number<CR>
nnoremap <Space>m :set nonumber<CR>
nnoremap <Space>t :set expandtab<CR>
nnoremap <Space>y :set noexpandtab<CR>

"" Gtag Keybind
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

"" Beep Off
set vb t_vb=

"" reopen with cursor that is last position.
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


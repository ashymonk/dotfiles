
" environment {{{

" support XDG
set undodir=$VIM_CACHE_HOME
set directory=$VIM_CACHE_HOME
set backupdir=$VIM_CACHE_HOME
set viminfo+='1000,n$VIM_CACHE_HOME/viminfo

" netrw
let g:netrw_home = $VIM_CACHE_HOME
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1

" gtags
let g:Gtags_Close_When_Single = 1

" }}}

"basic" {{{

" term
set ttymouse=sgr

" encoding and format
set encoding=utf-8
set fileformats=unix,dos
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp

" mouse
set mouse=a

" search
set ignorecase
set smartcase

" buffer
set hidden

" clipboard
set clipboard&
set clipboard^=unnamed,unnamedplus

" }}}

"statusline {{{

" ファイル名表示
set statusline=%F

" 変更チェック表示
set statusline+=%m

" 読み込み専用かどうか表示
set statusline+=%r

" ヘルプページなら[HELP]と表示
set statusline+=%h

" プレビューウインドウなら[Prevew]と表示
set statusline+=%w

" これ以降は右寄せ表示
set statusline+=%=

" ファイルフォーマット
set statusline+=[FF=%{&fileformat}]

" ファイルエンコード
set statusline+=[FENC=%{&fileencoding}]

" 現在行数/全行数
set statusline+=[LOW=%l/%L]

" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

" normalモードの入力文字を表示
set showcmd

" }}}

"tabline {{{

" show tabline when one tab is open.
set showtabline=2

" }}}

"programming" {{{

" search tag file in previous directory recusively.
set tags=./tags;

" indent
set cindent

" tabspace
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" }}}

"looks" {{{

" syntax highlight
syntax on

" color
set background=dark
colorscheme elflord

" font
if has('gui_running')

	set linespace=-1
	set guioptions-=m
	set guioptions-=T

	if has('gui_win32')
		set guifont=Cica:h11
		set guifontwide=Cica:h11
		set renderoptions=type:directx,renmode:5
	elseif has('gui_gtk2') || has('gui_gtk3')
		set guifont=Cica\ 11
		set guifontwide=Cica\ 11
	endif
endif

" Width Class Ambiguous is twice the width of ASCII characters.
set ambiwidth=double

" 行数表示
set number

" 検索時ハイライト
set hlsearch

" カーソルがある行のライン非表示
set nocursorline

" 不可視文字を表示
set list

" 不可視文字の表示記号
set listchars=tab:.\ ,trail:-,extends:>,precedes:<,nbsp:%

" 折り返し
set nowrap

" }}}



" environment {{{

" support XDG
set undodir=$XDG_CACHE_HOME/vim
set directory=$XDG_CACHE_HOME/vim
set backupdir=$XDG_CACHE_HOME/vim
set viminfo+='1000,n$XDG_CACHE_HOME/vim/viminfo

let g:netrw_home = $XDG_CACHE_HOME . '/vim'

" vim-racer
let g:racer_cmd = $CARGO_HOME . '/bin/racer'
let g:racer_experimental_completer = 1

" buftabline
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
let g:buftabline_separators = 0

" gtags
let g:Gtags_Close_When_Single = 1

" quickhl
let g:quickhl_manual_colors = [
	\ "cterm=NONE ctermfg=16 ctermbg=153 gui=NONE guifg=#ffffff guibg=#0a7383",
	\ "cterm=NONE ctermfg=7  ctermbg=1   gui=NONE guibg=#a07040 guifg=#ffffff",
	\ "cterm=NONE ctermfg=7  ctermbg=2   gui=NONE guibg=#4070a0 guifg=#ffffff",
	\ "cterm=NONE ctermfg=7  ctermbg=3   gui=NONE guibg=#40a070 guifg=#ffffff",
	\ "cterm=NONE ctermfg=7  ctermbg=4   gui=NONE guibg=#70a040 guifg=#ffffff",
	\ "cterm=NONE ctermfg=7  ctermbg=5   gui=NONE guibg=#0070e0 guifg=#ffffff",
	\ "cterm=NONE ctermfg=7  ctermbg=6   gui=NONE guibg=#007020 guifg=#ffffff",
	\ "cterm=NONE ctermfg=7  ctermbg=21  gui=NONE guibg=#d4a00d guifg=#ffffff",
	\ "cterm=NONE ctermfg=7  ctermbg=22  gui=NONE guibg=#06287e guifg=#ffffff",
	\ "cterm=NONE ctermfg=7  ctermbg=45  gui=NONE guibg=#5b3674 guifg=#ffffff",
	\ "cterm=NONE ctermfg=7  ctermbg=16  gui=NONE guibg=#4c8f2f guifg=#ffffff",
	\ "cterm=NONE ctermfg=7  ctermbg=50  gui=NONE guibg=#1060a0 guifg=#ffffff",
	\ "cterm=NONE ctermfg=7  ctermbg=56  gui=NONE guibg=#a0b0c0 guifg=black",
	\ ]

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

" indent width
set shiftwidth=4

" }}}

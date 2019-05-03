
"options {{{

"エンコード、テキスト種別" {{{

set encoding=utf-8
set fileformats=unix,dos
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

" }}}

"見た目" {{{

" フォント
if has('gui_running')
	set guifont=Ricty_Diminished:h10
	set guifontwide=Ricty_Diminished:h10
endif

" Width Class Ambiguous is twice the width of ASCII characters.
set ambiwidth=double

" 行数表示
set number

" 検索時ハイライト
set hlsearch

" カーソルがある行のライン非表示
set nocursorline

" タブ幅 4 文字
set tabstop=4

" 不可視文字を表示
set list

" 不可視文字の表示記号
set listchars=tab:>-,trail:-,eol:~,extends:>,precedes:<,nbsp:%

" 折り返し
set nowrap

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

"開発関連" {{{

" タグファイルの検索方法
set clipboard+=unnamed

" search tag file in previous directory recusively.
set tags=./tags;

" C インデント
set cindent

" 自動インデントでずれる幅
set shiftwidth=4

" バッファ内検索
set ignorecase
set smartcase

" cscope
if has("cscope")
	set csprg=cscope
	set csto=0
	set cst
	set csqf=s-,c-,d-,i-,t-,e-

	" add any database in current directory
	set nocsverb

	if filereadable("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif

	set csverb
endif

" swap file directory
set directory=~/.vim

" }}}

" }}}

"map {{{

" grep util
noremap <Space>g :vimgrep /<C-r><C-w>/ **/* \| cwin<CR>

" windows とのクリップボード共有コピー
if has('win32unix')
  vnoremap "*y :'<,'>w !cat > /dev/clipboard
endif

" cscope
noremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>:cwin<CR>
noremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>:cwin<CR>
noremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>:cwin<CR>
noremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>:cwin<CR>
noremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>:cwin<CR>
noremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:cwin<CR>
noremap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:cwin<CR>
noremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>:cwin<CR>

" refresh cscope db
noremap <F5> :cs kill cscope.out<CR>:!cscope -Rb<CR>:cs add cscope.out<CR>

" ESC disable IME
inoremap <ESC> <ESC>:set iminsert=0<CR>

" }}}

"cmdline {{{

" Open Current Directory
command! Dir $tabe .

" edit and reload vimrc
command! Ve $tabe $MYVIMRC
command! Vr source $MYVIMRC

" grep into current directory.
command! -complete=file -nargs=+ Grep call s:grep([<f-args>])
function! s:grep(args)
    let target = len(a:args) > 1 ? join(a:args[1:]) : '**/*'
    execute 'vimgrep' '/' . a:args[0] . '/j ' . target
    if len(getqflist()) != 0 | copen | endif
endfunction

" }}}

"autocmd {{{

" vim ファイルの折畳みコメント有効
autocmd FileType vim setlocal foldmethod=marker

" 行末ブランクをハイライトする
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" color scheme
autocmd ColorScheme * highlight Comment ctermfg=Gray guifg=Gray
autocmd ColorScheme * highlight SpecialKey ctermfg=DarkGray guifg=DarkGray

" }}}

"syntax {{{

" syntax highlight
syntax on
colorscheme elflord

" }}}

"plugin {{{


" }}}

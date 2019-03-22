
"設定" {{{

"エンコード、テキスト種別" {{{

set fileformats=unix,dos,mac
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

" }}}


"見た目" {{{

" 行数表示
set number

" シンタックスハイライト
syntax on

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

" }}}


"ステータスライン" {{{

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


"開発関連" {{{

" タグファイルの検索方法
" カレントディレクトリから登って探す
set tags=./tags;

" C インデント
set cindent

" 自動インデントでずれる幅
set shiftwidth=4

" }}}

" }}}

"ユーザ定義" {{{

"キーマップ" {{{

" <Space>g: grep util
noremap <Space>g :vimgrep /<C-r><C-w>/ **/* \| cwin<CR>

" windows とのクリップボード共有コピー
if has('win32unix')
  vnoremap "*y :'<,'>w !cat > /dev/clipboard
endif


" }}}


"コマンド" {{{

command! -complete=file -nargs=+ Grep call s:grep([<f-args>])
function! s:grep(args)
    let target = len(a:args) > 1 ? join(a:args[1:]) : '**/*'
    execute 'vimgrep' '/' . a:args[0] . '/j ' . target
    if len(getqflist()) != 0 | copen | endif
endfunction

" }}}


"オートコマンド" {{{

" vim ファイルの折畳みコメント有効
autocmd FileType vim setlocal foldmethod=marker

" 行末ブランクをハイライトする
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" }}}

" }}}


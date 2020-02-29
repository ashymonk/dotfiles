
" vim
autocmd FileType vim setlocal foldmethod=marker

" 行末ブランクをハイライトする
augroup HighlightTrailingSpaces
	autocmd!
	autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=DarkRed ctermbg=DarkRed
	autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" Quickfix
augroup qf
	autocmd!
	autocmd QuickFixCmdPost grep,grepadd,vimgrep,vimgrepadd,cscope cwindow
augroup END


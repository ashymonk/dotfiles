
" vim
autocmd FileType vim setlocal foldmethod=marker

" highlight traiing spaces
augroup HighlightTrailingSpaces
	autocmd!
	autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guifg=#444444 guibg=#303030 ctermfg=238 ctermbg=236
	autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" Quickfix
augroup qf
	autocmd!
	autocmd QuickFixCmdPost grep,grepadd,vimgrep,vimgrepadd,cscope cwindow
augroup END


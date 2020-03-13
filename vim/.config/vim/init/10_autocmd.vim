
" vim
autocmd FileType vim setlocal foldmethod=marker

" highlight traiing spaces
augroup HighlightTrailingSpaces
	autocmd!
	autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guifg=#C6C6C6 guibg=#EEEEEE ctermfg=251 ctermbg=255
	autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" Quickfix
augroup qf
	autocmd!
	autocmd QuickFixCmdPost grep,grepadd,vimgrep,vimgrepadd,cscope cwindow
augroup END


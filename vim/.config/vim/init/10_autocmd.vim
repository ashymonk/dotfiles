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

"##### auto fcitx  ###########
if executable("fcitx-remote")
    let g:input_toggle = 1
    function! Fcitx2en()
        let s:input_status = system("fcitx-remote")
        if s:input_status == 2
            let g:input_toggle = 1
            let l:a = system("fcitx-remote -c")
        endif
    endfunction

    function! Fcitx2zh()
        let s:input_status = system("fcitx-remote")
        if s:input_status != 2 && g:input_toggle == 1
            let l:a = system("fcitx-remote -o")
            let g:input_toggle = 0
        endif
    endfunction

    set ttimeoutlen=150
    "Leave Insert mode
    autocmd InsertLeave * call Fcitx2en()
    "Enter Insert mode
    autocmd InsertEnter * call Fcitx2zh()
endif
"##### auto fcitx end ######

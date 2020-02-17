
" edit configs
command! Ecfg Explore $XDG_CONFIG_HOME

" edit and reload vimrc
command! Evim edit $MYVIMRC
command! EVim Explore $VIM_CONFIG_HOME/init
command! Rvim source $MYVIMRC

" open current directory
command! Dir Explore .

" grep into current directory.
command! -complete=file -nargs=+ Grep call s:grep([<f-args>])
function! s:grep(args)
    let target = len(a:args) > 1 ? join(a:args[1:]) : '**/*'
    execute 'vimgrep' '/' . a:args[0] . '/j ' . target
    if len(getqflist()) != 0 | copen | endif
endfunction


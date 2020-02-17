
" ***************************
" * standard command keymap *
" ***************************
" select all
nnoremap <C-A> ggVG

" yank
vnoremap <C-C> y

" buffer
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" jump by tagstack
nmap <C-]> <C-]>zz
nmap <C-T> <C-T>zz

" jump by jumplist
nmap <C-O> <C-O>zz
nmap <C-I> <C-I>zz

" search
nmap n nzz
nmap N Nzz

" refresh global reference
noremap <F5> :!gtags -i<CR>

" ESC disable IME
inoremap <ESC> <ESC>:set iminsert=0<CR>

" windows とのクリップボード共有コピー
if has('win32unix')
  vnoremap "*y :'<,'>w !cat > /dev/clipboard
endif

let mapleader = ","
nmap <Leader>g \grep\
nmap <Leader>q \quickfix\
nmap <Leader>b \buffer\
nmap <Leader>w \windows\

" grep
noremap \grep\g :vimgrep /<C-r><C-w>/ **/* \| cwin<CR>
noremap \grep\b :vimgrep /<C-r><C-w>/ % \| cwin<CR>
noremap \grep\G :Grep<Space>

" quickfix
noremap \quickfix\o :copen<CR>
noremap \quickfix\c :cclose<CR>
noremap \quickfix\w :cwindow<CR>
noremap \quickfix\b :cbottom<CR>
noremap \quickfix\n :cnext<CR>
noremap \quickfix\p :cprevious<CR>
noremap \quickfix\N :cNext<CR>

" buffer
noremap \buffer\n :bnext<CR>
noremap \buffer\p :bprev<CR>
noremap \buffer\d :bdelete<CR>

" windows
noremap \windows\s :split<CR>
noremap \windows\v :vsplit<CR>
noremap \windows\n :new<CR>
noremap \windows\c :close<CR>
noremap \windows\o :only<CR>
noremap \windows\h :wincmd h<CR>
noremap \windows\j :wincmd j<CR>
noremap \windows\k :wincmd k<CR>
noremap \windows\l :wincmd l<CR>


" *************************
" * plugin command keymap *
" *************************

let mapleader = "\<Space>"
nmap <Leader>h \quickhl\
vmap <Leader>h \quickhl\
nmap <Leader>b \buftab\
nmap <Leader>j \gtags\

" vim-quickhl
nmap \quickhl\m <Plug>(quickhl-manual-this)
xmap \quickhl\m <Plug>(quickhl-manual-this)
nmap \quickhl\w <Plug>(quickhl-manual-this-whole-word)
xmap \quickhl\w <Plug>(quickhl-manual-this-whole-word)
nmap \quickhl\c <Plug>(quickhl-manual-clear)
vmap \quickhl\c <Plug>(quickhl-manual-clear)
nmap \quickhl\M <Plug>(quickhl-manual-reset)
xmap \quickhl\M <Plug>(quickhl-manual-reset)
nmap \quickhl\j <Plug>(quickhl-cword-toggle)
nmap \quickhl\] <Plug>(quickhl-tag-toggle)

" vim-buftabline
nmap \buftab\1 <Plug>BufTabLine.Go(1)
nmap \buftab\2 <Plug>BufTabLine.Go(2)
nmap \buftab\3 <Plug>BufTabLine.Go(3)
nmap \buftab\4 <Plug>BufTabLine.Go(4)
nmap \buftab\5 <Plug>BufTabLine.Go(5)
nmap \buftab\6 <Plug>BufTabLine.Go(6)
nmap \buftab\7 <Plug>BufTabLine.Go(7)
nmap \buftab\8 <Plug>BufTabLine.Go(8)
nmap \buftab\9 <Plug>BufTabLine.Go(9)
nmap \buftab\0 <Plug>BufTabLine.Go(10)

" gtags
nmap \gtags\t :Gtags <C-r><C-w><CR>
nmap \gtags\T :Gtags<Space>
nmap \gtags\r :Gtags -r <C-r><C-w><CR>
nmap \gtags\R :Gtags -r<Space>
nmap \gtags\s :Gtags -s <C-r><C-w><CR>
nmap \gtags\S :Gtags -s<Space>
nmap \gtags\g :Gtags -g <C-r><C-w><CR>
nmap \gtags\G :Gtags -g<Space>
nmap \gtags\f :Gtags -f %<CR>
nmap \gtags\F :Gtags -f<Space>
nmap \gtags\p :Gtags -P <C-r><C-w><CR>
nmap \gtags\P :Gtags -P<Space>
nmap \gtags\j :GtagsCursor<CR>


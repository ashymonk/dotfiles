" ****************************
" * keymaps with control key *
" ****************************
" yank
vnoremap <C-C> y

" switch buffer
nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprev<CR>

" jump by tagstack
nmap <C-]> <C-]>zz
nmap <C-T> <C-T>zz

" jump by jumplist
nmap <C-O> <C-O>zz
nmap <C-I> <C-I>zz

" jump function head
nmap [[ [[zz
nmap ]] ]]zz

" search
nmap n nzz
nmap N Nzz

" refresh global reference
noremap <F5> :!gtags -i<CR>

" ESC disable IME
inoremap <ESC> <ESC>:set iminsert=0<CR>

" Fzf files
nmap <C-P> :Files<CR>


" ***********************
" * keymaps with leader *
" ***********************
let mapleader = "\<Space>"
nmap <Leader>w \write\
nmap <Leader>g \grep\
nmap <Leader>q \quickfix\
nmap <Leader>b \buffer\
nmap <Leader>e \explore\
nmap <Leader>v \vimrc\
vmap <Leader>h \quickhl\
nmap <Leader>j \gtags\

" write
noremap \write\w :write<CR>
noremap \write\W :write!<CR>
noremap \write\q :wq<CR>
noremap \write\Q :wq!<CR>

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

" buffer (vim-buftabline)
noremap \buffer\d :bdelete<CR>
noremap \buffer\D :bdelete!<CR>
noremap \buffer\w :bwipeout<CR>
noremap \buffer\W :bwipeout!<CR>
noremap \buffer\l :ls<CR>
noremap \buffer\n :enew<CR>
nmap \buffer\1 <Plug>BufTabLine.Go(1)
nmap \buffer\2 <Plug>BufTabLine.Go(2)
nmap \buffer\3 <Plug>BufTabLine.Go(3)
nmap \buffer\4 <Plug>BufTabLine.Go(4)
nmap \buffer\5 <Plug>BufTabLine.Go(5)
nmap \buffer\6 <Plug>BufTabLine.Go(6)
nmap \buffer\7 <Plug>BufTabLine.Go(7)
nmap \buffer\8 <Plug>BufTabLine.Go(8)
nmap \buffer\9 <Plug>BufTabLine.Go(9)
nmap \buffer\0 <Plug>BufTabLine.Go(10)

" explore
noremap \explore\e :Explore<CR>
noremap \explore\E :Explore .<CR>
noremap \explore\s :Sexplore<CR>
noremap \explore\S :Sexplore .<CR>
noremap \explore\v :Vexplore<CR>
noremap \explore\V :Vexplore .<CR>

" vimrc
noremap \vimrc\r :source $MYVIMRC<CR>
noremap \vimrc\e :Explore $VIM_CONFIG_HOME/init<CR>
noremap \vimrc\p :Explore $VIM_DATA_HOME/plugged<CR>

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


let s:vim_plug_dir = $VIM_DATA_HOME . '/plugged'

call plug#begin( s:vim_plug_dir )

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'ap/vim-buftabline'
Plug 't9md/vim-quickhl'
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature'
Plug 'qpkorr/vim-bufkill'
Plug 'morhetz/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'mechatroner/rainbow_csv'

call plug#end()

"vim-buftabline" {{{

let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
let g:buftabline_separators = 0

" }}}

"vim-quickhl" {{{
let g:quickhl_manual_colors = [
	\ "ctermbg=89 guibg=#87005f",
	\ "ctermbg=29 guibg=#00875f",
	\ "ctermbg=94 guibg=#875f00",
	\ "ctermbg=24 guibg=#005f87",
	\ "ctermbg=64 guibg=#5f8700",
	\ "ctermbg=54 guibg=#5f0087",
	\ "ctermbg=18 guibg=#000087",
	\ "ctermbg=28 guibg=#008700",
	\ "ctermbg=88 guibg=#870000",
	\ "ctermbg=23 guibg=#005f5f",
	\ "ctermbg=53 guibg=#5f005f",
	\ "ctermbg=58 guibg=#5f5f00",
	\ "ctermbg=17 guibg=#00005f",
	\ "ctermbg=22 guibg=#005f00",
	\ "ctermbg=52 guibg=#5f0000",
	\ ]
" }}}

"vim-easy-align" {{{

if !empty( glob(s:vim_plug_dir . '/vim-easy-align') )
	" Start interactive EasyAlign in visual mode (e.g. vipga)
	xmap ga <Plug>(EasyAlign)

	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
	nmap ga <Plug>(EasyAlign)
endif

"}}}

"vim-bufkill" {{{

if !empty( glob(s:vim_plug_dir . '/vim-bufkill') )
        noremap \buffer\d :BD<CR>
        noremap \buffer\D :BD!<CR>
        noremap \buffer\w :BW<CR>
        noremap \buffer\W :BW!<CR>
endif

"}}}

"gruvbox" {{{

if !empty( glob(s:vim_plug_dir . '/gruvbox') )

	nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
	nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
	nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

	nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
	nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
	nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

	let g:gruvbox_italic = 0
	let g:gruvbox_contrast_dark = 'hard'
	let g:gruvbox_bold = 0

	set background=dark
	colorscheme gruvbox
endif

" }}}

"vim-cpp-enhanced-highlight" {{{

"let g:cpp_no_function_highlight = 1

" }}}

"vim-racer" {{{

let g:racer_cmd = $CARGO_HOME . '/bin/racer'
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

augroup Racer
	autocmd!
	autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
	autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
	autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
	autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
	autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

" }}}


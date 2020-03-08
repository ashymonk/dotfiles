
let s:vim_plug_dir = $VIM_DATA_HOME . '/plugged'

call plug#begin( s:vim_plug_dir )

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'ap/vim-buftabline'
Plug 't9md/vim-quickhl'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'yasukotelin/shirotelin'
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
	\ "cterm=NONE ctermfg=16 ctermbg=153 gui=NONE guifg=#000000 guibg=#0a7383",
	\ "cterm=NONE ctermfg=7  ctermbg=1   gui=NONE guibg=#a07040 guifg=#000000",
	\ "cterm=NONE ctermfg=7  ctermbg=2   gui=NONE guibg=#4070a0 guifg=#000000",
	\ "cterm=NONE ctermfg=7  ctermbg=3   gui=NONE guibg=#40a070 guifg=#000000",
	\ "cterm=NONE ctermfg=7  ctermbg=4   gui=NONE guibg=#70a040 guifg=#000000",
	\ "cterm=NONE ctermfg=7  ctermbg=5   gui=NONE guibg=#0070e0 guifg=#000000",
	\ "cterm=NONE ctermfg=7  ctermbg=6   gui=NONE guibg=#007020 guifg=#000000",
	\ "cterm=NONE ctermfg=7  ctermbg=21  gui=NONE guibg=#d4a00d guifg=#000000",
	\ "cterm=NONE ctermfg=7  ctermbg=22  gui=NONE guibg=#06287e guifg=#000000",
	\ "cterm=NONE ctermfg=7  ctermbg=45  gui=NONE guibg=#5b3674 guifg=#000000",
	\ "cterm=NONE ctermfg=7  ctermbg=16  gui=NONE guibg=#4c8f2f guifg=#000000",
	\ "cterm=NONE ctermfg=7  ctermbg=50  gui=NONE guibg=#1060a0 guifg=#000000",
	\ "cterm=NONE ctermfg=7  ctermbg=56  gui=NONE guibg=#a0b0c0 guifg=black",
	\ ]
" }}}

"vim-indent-guides" {{{
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 1
"let g:indent_guides_start_level = 2
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#DDDDDD ctermbg=254
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#EEEEEE ctermbg=255
" }}}

"shirotelin" {{{

if !empty( glob(s:vim_plug_dir . '/shirotelin') )
	augroup Shirotelin
		autocmd!
		autocmd ColorScheme * highlight Comment cterm=NONE guifg=#00AF00 ctermfg=34
	augroup END

	colorscheme shirotelin
endif

" }}}

"vim-cpp-enhanced-highlight" {{{

let g:cpp_no_function_highlight = 1

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


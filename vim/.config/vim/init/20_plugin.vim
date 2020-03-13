
let s:vim_plug_dir = $VIM_DATA_HOME . '/plugged'

call plug#begin( s:vim_plug_dir )

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'ap/vim-buftabline'
Plug 't9md/vim-quickhl'
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
	\ "ctermbg=195 guibg=#D7FFFF",
	\ "ctermbg=225 guibg=#FFD7FF",
	\ "ctermbg=230 guibg=#FFFFD7",
	\ "ctermbg=189 guibg=#D7D7FF",
	\ "ctermbg=194 guibg=#D7FFD7",
	\ "ctermbg=224 guibg=#FFD7D7",
	\ "ctermbg=183 guibg=#D7AFFF",
	\ "ctermbg=193 guibg=#D7FFAF",
	\ "ctermbg=153 guibg=#AFD7FF",
	\ "ctermbg=223 guibg=#FFD7AF",
	\ "ctermbg=158 guibg=#AFFFD7",
	\ "ctermbg=218 guibg=#FFAFD7",
	\ "ctermbg=159 guibg=#AFFFFF",
	\ "ctermbg=219 guibg=#FFAFFF",
	\ "ctermbg=229 guibg=#FFFFAF",
	\ "ctermbg=147 guibg=#AFAFFF",
	\ "ctermbg=157 guibg=#AFFFAF",
	\ "ctermbg=217 guibg=#FFAFAF",
	\ ]
" }}}

"shirotelin" {{{

if !empty( glob(s:vim_plug_dir . '/shirotelin') )
	augroup Shirotelin
		autocmd!
		autocmd ColorScheme * highlight Comment ctermfg=34 guifg=#00AF00
	augroup END

	colorscheme shirotelin
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


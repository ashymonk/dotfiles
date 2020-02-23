
let s:vim_plug_dir = $VIM_DATA_HOME . '/plugged'

call plug#begin( s:vim_plug_dir )

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'ap/vim-buftabline'
Plug 't9md/vim-quickhl'
Plug 'yasukotelin/shirotelin'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'mechatroner/rainbow_csv'

call plug#end()

"vim-buftabline" {{{

let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
let g:buftabline_separators = 0

" }}}

"shirotelin" {{{

if !empty( glob(s:vim_plug_dir . '/shirotelin') )
	colorscheme shirotelin
endif

" }}}

"vim-racer" {{{

let g:racer_cmd = $CARGO_HOME . '/bin/racer'
let g:racer_experimental_completer = 1

autocmd FileType rust nmap gd <Plug>(rust-def)
autocmd FileType rust nmap gs <Plug>(rust-def-split)
autocmd FileType rust nmap gx <Plug>(rust-def-vertical)
autocmd FileType rust nmap <leader>gd <Plug>(rust-doc)

" }}}


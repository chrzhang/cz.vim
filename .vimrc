syntax on
set background=dark
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set number
set cul
hi CursorLine term=none cterm =none ctermbg=3
set history=100
colorscheme elflord  
let g:neocomplcache_enable_at_startup = 1 
let g:neocomplcache_enable_insert_char_pre = 1 "No pop-up when scrolling
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set colorcolumn=80
hi ColorColumn ctermbg=lightblue guibg=lightblue
set ignorecase
set smartcase
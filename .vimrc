" Syntax highlighting
syntax on

" Tell Vim what the background color looks like
set background=dark

" Show the line # on the bar
set ruler

" Use spaces instead of tab characters
set noexpandtab

" Automatically use one extra level of indentation
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab
set number
set cul
hi CursorLine term=none cterm =none ctermbg=3
set history=100
colorscheme elflord
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set colorcolumn=80
hi ColorColumn ctermbg=lightblue guibg=lightblue
set ignorecase
set smartcase
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1]!~'\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
set wrap
set linebreak
set nolist

" Remap semicolon to colon (don't need to hold shift anymore)
nnoremap ; :

" The ESC key is a bit far. Type two j's rapidly to exit INSERT
inoremap jj <ESC>

" Don't bother redrawing in the middle of macros
set lazyredraw

" Autocompletion
set wildmenu

" Search as characters are intered
set incsearch

" Highlight matches
set hlsearch

set showcmd

" Remove trailing whitespace from filetypes given
autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

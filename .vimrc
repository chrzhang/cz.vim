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
nnoremap ; :

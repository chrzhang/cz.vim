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

" Remember more cmds, search history, etc.
set history=1000

" More undoing
set undolevels=1000

colorscheme delek
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set colorcolumn=80
hi ColorColumn ctermbg=lightblue guibg=lightblue
set ignorecase

" Ignore case if search pattern is all lowercase
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
inoremap JJ <ESC>
inoremap Jj <ESC>
inoremap jJ <ESC>

" Don't bother redrawing in the middle of macros
set lazyredraw

" Autocompletion
set wildmenu

" Horizontal, unobstructive (and default to longest match as first)
set wildmode=longest:full,full


" Search as characters are intered
set incsearch

" Highlight matches
set hlsearch

set showcmd

" Preserve cursor position after trimming trailing whitespace after save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Remove trailing whitespace from filetypes given
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=LightGray guibg=LightGray
match ExtraWhitespace /\s\+$/

" Space opens/closes folds
nnoremap <space> za

" Fold based on indents so headers are still highlighted
set foldmethod=indent

" Don't fold comments
let c_no_comment_fold = 1

" Fold only top level
set foldnestmax=0

" Instead of beeping on error, flash
set visualbell
set noerrorbells

" Don't wrap
set nowrap

" Show matching parenthesis
set showmatch

set undofile
set undodir=~/vimundo

" Remember the cursor location between opening/closing the file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Smoother scroll
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" Quickly switch out of paste mode for non-staggered multi-line pastes
set pastetoggle=<F10>

" Allow backspacing over everything in INSERT mode
set backspace=indent,eol,start

" Set the title of the terminal to the current file
set title

" Don't clutter current workspace with swap files
set swapfile
set dir=~/swapfile

" Move between windows open in vim more smoothly (just hold Ctrl then h,j,k,l)
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Clear highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

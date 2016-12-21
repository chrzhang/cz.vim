execute pathogen#infect()

" Syntax highlighting
syntax on

" Better color map for syntax highlighting with black background
set background=dark

" Show the line and column # of cursor on the bar
set ruler

" Use spaces instead of tab characters
set noexpandtab

" Automatically use one extra level of indentation
set smartindent

" A hard TAB is 4 columns
set tabstop=4

" Add / remove 4 spaces when hitting a TAB / BACKSPACE
set softtabstop=4

" >> and << will indent and unindent by 4 columns
set shiftwidth=4

" Round indent to multiple of shiftwidth
set shiftround

" Add spaces when TAB is hit
set expandtab

" Set line number of current line
set number

" Set line number of neighboring lines to be offset to current line
set relativenumber

" Highlight the line the cursor is on
set cul
hi CursorLine term=none cterm =none ctermbg=3

" Remember more cmds, search history, etc.
set history=1000

" More undoing
set undolevels=1000

" Customize colors
set t_Co=256
colo devbox-dark-256

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set colorcolumn=80
hi ColorColumn ctermbg=lightblue guibg=lightblue
set ignorecase

" Ignore case if search pattern is all lowercase
set smartcase

" Auto-complete on tab
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1]!~'\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

set linebreak

" Turn off markers for 'invisible' text markers
set nolist

" Remap semicolon to colon (don't need to hold shift anymore)
nnoremap ; :

" The ESC key is a bit far. Type two j's rapidly to exit INSERT
inoremap jk <ESC>

inoremap :; ::

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

" Show cmd in last line of screen
set showcmd

" Preserve cursor position after trimming trailing whitespace after save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Remove trailing whitespace from filetypes given
autocmd FileType c,cpp,java,php,ruby,py autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=LightGray guibg=LightGray
match ExtraWhitespace /\s\+$/

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

set cuc

set scrolloff=15

map <C-n> :NERDTreeToggle<CR>

" So Nerdtree displays arrows in Putty (also see .profile settings)
let g:NERDTreeDirArrows=0

" So gitgutter draws gutter symbols faster
set updatetime=20

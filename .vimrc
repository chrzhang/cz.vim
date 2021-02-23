set nocompatible
" Syntax highlighting
syntax on

" Tell Vim what the background color looks like
set background=dark
set re=1

" Show the line # on the bar
set ruler

" Use spaces instead of tab characters
set noexpandtab

" Automatically use one extra level of indentation
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab
set nu
set cul " cursor line
" set cuc " cursor column
hi CursorLine term=none cterm =none ctermbg=5
set cuc

set scrolloff=5
set sidescrolloff=1
set sidescroll=1

" Remember more commands, search history, etc.
set history=1000

" More undoing
set undolevels=1000

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
set linebreak
set nolist
set nowrap
" Remap semicolon to colon (don't need to hold shift anymore)
nnoremap ; :

" The ESC key is a bit far. Type two <j> rapidly to exit INSERT
inoremap jk <ESC>
inoremap JK <ESC>
inoremap Jk <ESC>
inoremap jK <ESC>

" Autocompletion
set wildmenu

" Horizontal, unobstructive (and default to longest match as first)
set wildmode=longest:full,full

" Search as characters are entered
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
autocmd FileType c,cpp,java,php,ruby,json,sh,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces() 

" Make PEP8 a little happier
set softtabstop=4
set autoindent
set fileformat=unix

set encoding=utf-8

" Space opens/closes folds
nnoremap <space> za

" Don't fold comments
let c_no_comment_fold = 1

" Show matching parenthesis
set showmatch

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

" Move between windows open in vim more smoothly (just hold Ctrl then h,j,k,l)
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

try
    set undodir=~/vimundo
    set undofile
catch
endtry

set t_Co=256

colorscheme seoul256

" Add meta include-guard
nmap <F7> yyPwdwiifndef INCLUDED<Esc>lr_vw~wDjo#endif<Esc>o<Esc>

set clipboard=unnamed

let mapleader=","
vnoremap <Leader>s :sort<CR>

" Always show the name of the current file
set statusline+=%f
set laststatus=2

" Re-map Enter and Shift-enter to add a blank line but don't go to Insert mode as do o and O
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" No swap files
set nobackup
set nowb
set noswapfile

set autoread

set nowrap

nmap j gj
nmap k gk

set showbreak=>\  "have soft-wrap prefix

set colorcolumn=79

" Search over visual ranges
function! RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
          \ '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>

" Highlight a column in csv text.
" :Csv 1    " highlight first column
" :Csv 12   " highlight twelfth column
" :Csv 0    " switch off highlight
function! CSVH(colnr)
  if a:colnr > 1
    let n = a:colnr - 1
    execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
    execute 'normal! 0'.n.'f,'
  elseif a:colnr == 1
    match Keyword /^[^,]*/
    normal! 0
  else
    match
  endif
endfunction
command! -nargs=1 Csv :call CSVH(<args>)

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ' 49/64'
let g:airline_left_alt_sep = ' 25/32'
let g:airline_right_sep = ' 51/64'
let g:airline_right_alt_sep = ' 13/16'
let g:airline_symbols.branch = ' 33/64'
let g:airline_symbols.readonly = ' 35/64'
let g:airline_symbols.linenr = ' 17/32'

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" show trailing ws
set listchars=tab:>-,trail:-
set list

filetype indent on " So you can do gg=G from normal mode

set clipboard=unnamed
set mouse=nicr

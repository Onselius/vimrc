syntax enable " enable syntax processing
let mapleader="," " leader is comma

set tabstop=4 " number of visual spaces for TAB
set softtabstop=4 " number of spaces in TAB when editing
set expandtab " TABs are spaces

set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
filetype indent on " load filetype-specific indent files
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when need to
set showmatch " highlight matching {[()]}

set incsearch " search as characters are entered
set hlsearch " hightlight matches
nnoremap <leader><space> :nohlsearch<CR>

set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent

inoremap ii <esc>
nmap <F5> <esc>:w<CR>: !clear;python3 %<CR>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'davidhalter/jedi-vim'
Plug 'townk/vim-autoclose'
call plug#end()

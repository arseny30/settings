set nocompatible              " be iMproved, required

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Fast motion.
Plugin 'Lokaltog/vim-easymotion'

" Git
Plugin 'tpope/vim-fugitive'

" FS explorer
Plugin 'scrooloose/nerdtree'

" Easy comment/uncomment
Plugin 'scrooloose/nerdcommenter'

" Color schemes
Plugin 'Lucius'
Plugin 'dracula/vim'

" C++ clever highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

" Matching parenthes are colored with the same color
Plugin 'kien/rainbow_parentheses.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'wellle/targets.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-function'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-operator-user'

" Plugin 'lyuts/vim-rtags'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'airblade/vim-gitgutter'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'vim-scripts/a.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-abolish.git'

Plugin 'vimwiki/vimwiki'

Plugin 'fatih/vim-go'
Plugin 'vim-syntastic/syntastic'

Plugin 'rust-lang/rust.vim'

"Plugin tpope/vim-obsession
" to explore
"Plugin 'tpope/vim-surround'
"Plugin 'derekwyatt/vim-scala'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'vim-scripts/argtextobj.vim'
"

" Fix mappings and use?
" Crazy default keys mapping, but nice
"Plugin 'matze/vim-move'

" Nice line with miscellaneous information
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

syntax on
set background=dark

" misc
set encoding=utf-8
set fileencoding=utf-8
set hlsearch
nnoremap <silent> <C-l> :nohl<CR><C-l>
set cursorline
set autowrite
set wildmenu

" Easymotion will use <Leader> instead of default <Leader><Leader>
map <Leader> <Plug>(easymotion-prefix)

" Color scheme
"colorscheme badwolf
colorscheme lucius
LuciusBlack
"colorscheme dracula

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" When editing a file, always jump to the last known cursor position.
augroup vimrcEx
autocmd!
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
augroup END

" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
silent call system('mkdir -p ' . &undodir) " create undo dir

" clang-format
augroup clangFormat
autocmd!
 autocmd BufWritePre *.cpp,*.h,*.hpp,*.c :%py3f ~/.vim/clang-format.py
augroup END

" rust-fmt
let g:rustfmt_autosave = 1

"augroup jsFormat
"autocmd!
"autocmd BufWritePre *.js :silent !standard --fix %
"augroup END

"autocmd bufwritepost *.js :silent !standard --fix 2> /dev/null 2> /dev/null %

" expand region
map <C-k> <Plug>(expand_region_expand)
map <C-j> <Plug>(expand_region_shrink)
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'ia'  :0,
      \ 'aa'  :0,
      \ 'if'  :0,
      \ 'af'  :0,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }

" Multiple cursors
let g:multi_cursor_exit_from_insert_mode=0

" Move lines
let g:move_key_modifier = 'C'

" fswitch
nmap <silent> <Leader>of :FSHere<cr>

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#ycm#enabled = 1

let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['go', 'govet']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['eslint']



"map gm :e <cfile>.md<cr>

set keymap=russian-jcukenwin
"set iminsert=0
"set imsearch=0
"setlocal spell spelllang=ru_ru,en_us


" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"

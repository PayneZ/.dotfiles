set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'Valloric/YouCompleteMe'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'


" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"
"
" RainbowParenthese
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ]

"    \ ['darkred',     'SeaGreen3'],
"    \ ['red',         'firebrick3'],
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle

au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" Latex-Suite
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

filetype on


" Basic
colorscheme Tomorrow-Night

set number
set encoding=utf-8
set fencs=utf-8
set autoindent
set cindent
set backspace=indent
set ru
syntax on
set hlsearch
set ts=4
set sw=4
set expandtab
set smartindent
set noswapfile

" commands
let mapleader=","
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>la :w<cr>:!xelatex --shell-escape %<cr>
nnoremap <leader>bb :w<cr>:!xelatex %<cr>:w<cr>:!bibtex %:t:r.aux<cr>:w<cr>:!xelatex %<cr>:w<cr>:!xelatex %<cr>
nnoremap <leader>df :!open -a Preview %:t:r.pdf<cr>
nnoremap <leader>md :w<cr>:!retext %<cr>
nnoremap <leader>py :w<cr>:!python3 -i %<cr>
nnoremap <leader>ct :%s/\i\+/&/gn<cr>
nnoremap <leader>a ggVG"+y
nnoremap <leader>cc :w<cr>:!cc % -o %:t:r.out<cr>
nnoremap <leader>wc :!wc -w %<cr>

vnoremap <leader>c "+y


inoremap jk <esc>
" insert paired parenthese
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
nnoremap <leader>( bi(<esc>ea)<esc>i
nnoremap <leader>9 F(i(<esc>l%a)<esc>
inoremap mk <right>



" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

inoremap ;; <esc>A;<esc>o

if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

" python specials
augroup filetype_python
    autocmd!
    autocmd FileType python :nnoremap <buffer> <leader>m I#<esc>
    autocmd FileType python :inoremap :: <esc>A:<esc>o
    autocmd FileType python :inoremap jj <esc>3wi, 
    autocmd FileType python :inoremap hh <left><left><left><left><Del><Del><Del><Del>
    autocmd FileType python :nnoremap <F5> :w!<cr>:!ipython -i %<cr>
augroup END    

augroup filetype_tex
    autocmd!
    autocmd FileType tex setlocal spell spelllang=en_us
    autocmd FileType tex set tabstop=2
    autocmd FileType tex set noautoindent
    autocmd FileType tex colorscheme solarized
    "autocmd BufRead, BufNewFile *.tex colorscheme solarized
augroup END    

augroup FileType_c
    autocmd FileType c :inoremap ;; <esc>A;<esc>o
    autocmd FileType h :inoremap ;; <esc>A;<esc>o
    autocmd FileType c :inoremap { {<Enter>}<esc>ko
    autocmd FileType h :inoremap { {<Enter>}<esc>ko
    autocmd FileType c :inoremap <C-.> ->
augroup END


augroup filetype_scheme
    autocmd!
    autocmd FileType scheme :inoremap jj <esc>la<cr><tab>
    autocmd FileType scheme :inoremap hh <left><left><left><left><Del><Del><Del><Del>
    autocmd FileType scheme :nnoremap <c-h> ohh
    autocmd FileType scheme :set noautoindent
    autocmd FileType scheme :inoremap cond cond<tab>
    autocmd FileType scheme :inoremap cons cons<tab>
    autocmd FileType scheme :nnoremap <F5> :w!<cr>:!raco make %<cr>
augroup END

augroup filetype_markdown
    autocmd!
    autocmd FileType markdown :syntax off
augroup END


"
"
"       ___ _                 _ _
"      / __\ |__   __ ___   _(_) |_ __ _
"     / /  | '_ \ / _` \ \ / / | __/ _` |
"    / /___| | | | (_| |\ V /| | || (_| |
"    \____/|_| |_|\__,_| \_/ |_|\__\__,_|
"
"
"
"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set nocompatible
let g:python3_host_prog = '/opt/homebrew/bin/python3'

set encoding=utf-8
set number
set title
set relativenumber
set mouse=a
set clipboard=unnamed
set spell spelllang=en_us
set splitright
set hidden

autocmd BufWritePre * %s/\s\+$//e " remove trainling spaces


" Cursor
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

set showcmd
set t_Co=256
set cursorline
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set foldmethod=syntax
set foldlevel=99
set autoindent

set listchars=tab:··,trail:·,extends:#,nbsp:.
set backspace=indent,eol,start
set conceallevel=0
let g:vim_json_syntax_conceal = 0
let g:vim_json_conceal=0

filetype plugin on
syntax on
set termguicolors
set background=dark

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader=" "

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

imap jj <esc>
imap jk <esc>
nmap q :bp\|bd #<CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" next buffer with tab
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>


" Search between files
nnoremap <silent> <Leader>s :Ag<CR>

nmap <Leader>w :w<CR> " save file
nmap <Leader>q :q<CR> " close
nmap <Leader>x :bd<CR> " close buffer
nmap <Leader>p :CtrlP<CR>
nmap <leader>l :CocCommand prettier.formatFile<CR>

" Quicker switching between windows
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" Resize windows
nmap <silent> <Left> :3wincmd <<CR>
nmap <silent> <Right> :3wincmd ><CR>
nmap <silent> <Up> :3wincmd +<CR>
nmap <silent> <Down> :3wincmd -<CR>
"vmap <silent> <C-h> :wincmd h<CR>
"vmap <silent> <C-j> :wincmd j<CR>
"vmap <silent> <C-k> :wincmd k<CR>
"vmap <silent> <C-l> :wincmd l<CR>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

noremap <Leader>y "*y
noremap <Leader>Y "+y

" Movement
"" Preserve indentation when moving lines
" See http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <C-j> :m .+1<Return>==
nnoremap <C-k> :m .-2<Return>==
vnoremap <C-j> :m '>+1<Return>gv=gv
vnoremap <C-k> :m '<-2<Return>gv=gv
vnoremap <C-z> :wa <cr>

" Plugins
" source $HOME/.config/nvim/plugins.vimrc
"
" Theming
"source $HOME/.config/nvim/theming.vimrc

nnoremap <leader>1 :1tabnext<CR>
nnoremap <leader>2 :2tabnext<CR>
nnoremap <leader>3 :3tabnext<CR>
nnoremap <leader>4 :4tabnext<CR>
nnoremap <leader>5 :5tabnext<CR>
nnoremap <leader>6 :6tabnext<CR>
nnoremap <leader>7 :7tabnext<CR>
nnoremap <leader>8 :8tabnext<CR>
nnoremap <leader>9 :9tabnext<CR>

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

"source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/vem-tabline.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/coc-tailwind-intellisense.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/devicons.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/indentline.vim
source ~/.config/nvim/plugins/multiple-cursors.vim
source ~/.config/nvim/plugins/todo-comments.vim
"source ~/.config/nvim/plugins/ale.vim
source ~/.config/nvim/plugins/lualine.vim

source ~/.config/nvim/plugins/everforest.vim
source ~/.config/nvim/plugins/gruvbox.vim
source ~/.config/nvim/plugins/zenburn.vim
source ~/.config/nvim/plugins/nightfox.vim
source ~/.config/nvim/plugins/nord.vim
source ~/.config/nvim/plugins/gruvbox-material.vim

source ~/.config/nvim/plugins/go.vim
source ~/.config/nvim/plugins/omnisharp.vim
source ~/.config/nvim/plugins/pug.vim
source ~/.config/nvim/plugins/docker.vim

call plug#end()

colorscheme nordfox

" general {{{

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

" cursor

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" }}}


" ide {{{

set showcmd
set t_Co=256
set cursorline
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set foldmethod=syntax
set foldlevel=99
set autoindent

set listchars=tab:··,trail:·,extends:#,nbsp:.
set backspace=indent,eol,start

" }}}

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

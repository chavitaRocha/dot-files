" normal {{{

imap jj <esc>
imap jk <esc>
nmap q :bd<CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" next buffer with tab
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>

" }}}

" leader {{{

" Fzf fzf
nnoremap <silent> <Leader>s :Ag<CR>
"nnoremap <silent> <Leader>f :Ag<CR>

nmap <Leader>w :w<CR> " save file
nmap <Leader>q :q<CR> " close
nmap <Leader>x :bd<CR> " close buffer
nmap <Leader>p :CtrlP<CR>
nnoremap <Leader>b :NERDTreeToggle<CR>
nmap <Leader>f :Prettier<CR>

nnoremap <Leader>h :3wincmd <<CR>
nnoremap <Leader>l :3wincmd ><CR>
nnoremap <Leader>k :3wincmd +<CR>
nnoremap <Leader>j :3wincmd -<CR>


noremap <Leader>y "*y
noremap <Leader>Y "+y

" coc

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" }}}

" control {{{

" resize windows

"nmap <C-left> :3wincmd <<CR>
"nmap <C-right> :3wincmd ><CR>
"nmap <C-up> :3wincmd +<CR>
"nmap <C-down> :3wincmd -<CR>

" }}}

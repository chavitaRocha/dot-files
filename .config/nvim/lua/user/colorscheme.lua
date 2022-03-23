vim.cmd [[
try
  colorscheme aurora
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

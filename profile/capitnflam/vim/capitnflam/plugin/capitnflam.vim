" Color scheme compatible with both gui & terminal
colorscheme elflord

" leader key
let mapleader=";"

" Show the cmd in the bottom right corner
set showcmd

" Show the current mode
set showmode

" Mapping F8 to toggle tag list
nnoremap <silent> <F8> :TlistToggle<CR>

" Disable visual bell
set noeb vb t_vb=

" Indentation parameters
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Adding some file types
au BufNewFile,BufRead mk.inc set filetype=make
au BufNewFile,BufRead mk.spec set filetype=make

" Autoload cscope database
" http://vim.wikia.com/wiki/Autoloading_Cscope_Database
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

" cscope binding on leader key
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Copy/cut/paste to/from OS clipboard
vmap <leader>y "+y
vmap <leader>d "+d
vmap <leader>p "+p
nmap <leader>y "+y
nmap <leader>yy "+yy
nmap <leader>d "+d
nmap <leader>dd "+dd
nmap <leader>p "+p

" Reindent file
map <F7> mzgg=G`z<CR>

if has("gui_running")
" Put gvim only configuration here
" Disable visual bell
set vb t_vb=

" Display some invisible characters (tab, trailing spaces, eol)
set list
set listchars=tab:  ,trail:·,eol:¶

else
" Put vim only configuration here
endif

source $VIMRUNTIME/vimrc_example.vim

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set encoding=utf-8
set guifont=Consolas:h14:cANSI

" pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" taglist
let Tlist_Show_One_File=1    " 只展示一个文件的taglist
let Tlist_Exit_OnlyWindow=1  " 当taglist是最后以个窗口时自动退出
let Tlist_Use_Right_Window=1 " 在右边显示taglist窗口
let Tlist_Sort_Type="name"   " tag按名字排序
let Tlist_Auto_Open=1
map <F3> :TlistToggle<CR>

" nerdtree
map <F2> :NERDTreeToggle<CR>
"autocmd BufRead * 25vsp ./
autocmd vimenter * NERDTree

" MiniBufExplorer
let g:miniBufExplMaxSize = 2

" column & line
set cursorline
set cursorcolumn

" LeaderF
" map <F4> :LeaderfLine<CR>

" colorscheme
colorscheme quantum
set background=dark
map <F9> :colorscheme quantum<CR>
map <F10> :colorscheme solarized<CR>

" number
set number

" set past
set noai nosi
set paste

" set gui
set guifont=Consolas:h12
set guioptions-=m
set guioptions-=T
set guioptions-=L 
set guioptions-=r
set guioptions-=b
au GUIEnter * simalt ~x

" vim-latex
"let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'

let g:livepreview_previewer = 'zathura'
let g:livepreview_previewer = 'open -a Preview'

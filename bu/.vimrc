set rtp+=~/.vim/bundle/Vundle.vim
execute pathogen#infect()
""" ---------------------------------------------------------------------------
""" Standard options
syntax on
filetype plugin indent on
"""colorscheme  evening
set expandtab tabstop=4
set shiftwidth=4
set number
set laststatus=2
set tags=./tags;,tags;
"""set tags+=/opt/nrf52_sdk/tags
set hlsearch
set spelllang=en_us
set nospell
set nowrap
"""set cursorline
set path+=**
set wildmenu
set wildmode=longest:full,full

""" ---------------------------------------------------------------------------
""" Vundle package manger option
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Conque-GDB'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scuilion/markdown-drawer'
call vundle#end()
let g:markdrawer_drawer_max_levels = 2
""" ---------------------------------------------------------------------------
""" OmniCppComplete for finishing structures from tag file
Plugin 'OmniCppComplete'

""" Function keys.
map <F2> :!tig <CR>
map <F3> :!git diff --name-only<CR>
map <F4> :!git difftool --tool=vimdiff --no-prompt %<CR>

map <F5> : let g:ConqueGdb_Disable = 0 <CR>

map <F6> :!/opt/local/bin/ctags --exclude=.git --exclude=scanner/sdk -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F7> :vertical resize -10 <CR>
map <F8> :vertical resize +10 <CR>
map <F9>  :!make clean <CR>
""" map <F10> :make -f makefile.generic release=001 <CR>
map <F10> :make  <CR>
map <F12> :!make prog<CR>


map <F1> :grep -i -r --include "*.[ch]" reason .

" " OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1   " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"""map <F11> :let g:ConqueGdb_GdbExe = '/opt/gcc-arm-none-eabi-5_4-2016q3/bin/arm-none-eabi-gdb'
let g:ConqueGdb_GdbExe = '/opt/gcc-arm-none-eabi-5_4-2016q3/bin/arm-none-eabi-gdb'
let g:ConqueGdb_Disable = 1

""" ---------------------------------------------------------------------------
""" Switching from c file to header file 
""" git clone https://github.com/ericcurtin/CurtineIncSw.vim.git ~/.vim/bundle/CurtineIncSw.vim
"""map <F5> :call CurtineIncSw()<CR>

""" ---------------------------------------------------------------------------
""" Nerdtree options
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'

""" ---------------------------------------------------------------------------
""" Cscope options. 
if has('cscope')
  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

"""  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
  let cscope_file=findfile("cscope.out", ".;")
   let cscope_pre=matchstr(cscope_file, ".*/")
   "echo cscope_file
   if !empty(cscope_file) && filereadable(cscope_file)
      exe "cs add" cscope_file cscope_pre
   endif
endif

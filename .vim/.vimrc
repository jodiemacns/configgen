""" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
""" git clone https://github.com/ericcurtin/CurtineIncSw.vim.git ~/.vim/bundle/CurtineIncSw.vim
""" Launch vim and run :PluginInstall

""" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
""" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
""" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

set rtp+=~/.vim/bundle/Vundle.vim
execute pathogen#infect()

""" ---------------------------------------------------------------------------
""" Standard options
syntax on
filetype plugin indent on
"""colorscheme  evening
set expandtab tabstop=4
set shiftwidth=3
set number
set tags=./tags;,tags;
set nohlsearch
set spelllang=en_us
set nospell
set nowrap

""" ---------------------------------------------------------------------------
""" Vundle package manger option
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Conque-GDB'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scuilion/markdown-drawer'
Plugin 'tpope/vim-fugitive'


call vundle#end()
let g:markdrawer_drawer_max_levels = 2
""" ---------------------------------------------------------------------------
""" OmniCppComplete for finishing structures from tag file
Plugin 'OmniCppComplete'
""" Plugin 'Conque-GDB'

" " build tags of your own project with Ctrl-F12
set path=$PWD/**
set wildmenu
set wildmode=longest:full,full

highlight Visual cterm=bold ctermbg=Black ctermfg=NONE


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

""" ---------------------------------------------------------------------------
""" Switching from c file to header file 
map <F5> :call CurtineIncSw()<CR>

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

command! Copen botright copen
command! Pr !./open_flash.sh iot_valve.bin
command! Rw :%s/\s\+$//e
command! Rtab :%s/\t/    /e
command! Rms :%s/^M//e
command! Cbuf :%bd|e#

"""mand! Dbg normal mZ:ConqueGdb bt.out<CR><ESC><cr>i<c-c>ll<cr>c<cr><esc><c-w>k`Z
command! Dbg normal mZ:ConqueGdb bt.out<CR>i<c-c>ll<cr>c<cr><esc><c-w>k`Z
command! Db  normal mZ:ConqueGdb iot_valve.out<CR>i<c-c>ll<cr>c<cr><esc><c-w>k`Z
command! Mc :make -j8 client

command! Toc normal yypVgudwV:s/ /-/g<CR>0i(#<ESC>A)<ESC>k0dwi[<ESC>A]<ESC>Jx

let mapleader=" "

""" Function keys.
map <F1> :grep -i -r --include "*.[ch]" reason .
map <F2> :!tig <CR>
map <F3> :!git diff --name-only<CR>
map <F4> :!git difftool --tool=vimdiff --no-prompt %<CR>
map <F5> mz :Rw <CR> :Rtab <CR> :Rms <CR>:set nohlsearch<CR>`z
map <F6> :!ctags --exclude=.git --exclude=documents --exclude=docs --exclude=scanner/sdk -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
""" Insert the comments.
map <F7> <ESC>$80a <ESC>080ld$
map <F8> <ESC>$80a <ESC>060ld$i///<
map <F9>  :make clean <CR>
map <F10> :make -j8 debuggdb<CR> :Copen <CR>
map <F11> :colorscheme morning<CR>
map <F12> :source ~/configgen/.vim/meta5.vim<CR>

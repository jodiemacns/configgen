command! Copen botright copen
command! Pr !./open_flash.sh iot_valve.bin 
command! Rw :%s/\s\+$//e 
command! Rtab :%s/\t/    /g
command! Rms :%s///e
command! Cbuf :%bd|e#
command! Mjhex qqi0x<Esc>li,<Esc>l

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
map <F6> :!ctags --exclude=modem_evaluation --exclude=.git --exclude=notes --exclude=docs --exclude=scanner/sdk -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
""" Insert the comments.
map <F7> <ESC>$80a <ESC>080ld$
map <F8> <ESC>$80a <ESC>060ld$i///< 
map <F9>  :make clean <CR>
map <F10> :make -j8 debuggdb<CR> :Copen <CR>
map <F11> :colorscheme morning<CR>
map <F12> :source ~/configgen/.vim/meta5.vim<CR>


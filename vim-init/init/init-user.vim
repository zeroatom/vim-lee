let g:ldoc_authorName = "lee"

" 新建.sh .lua等文件自动调用SetTitle函数
autocmd BufNewFile *.sh exec ":call SetTitle()"

autocmd BufNewFile *.py exec ":call SetPyTitle()"
 
function SetComment_sh()
    call setline(3, "#================================================================") 
    call setline(4, "#   描    述：") 
    call setline(5, "#   Author：lee")
    call setline(6, "#   Email：china2011long@163.com")
    call setline(7, "#   Create Time：".strftime("%c")) 
    call setline(8, "#")
    call setline(9, "#================================================================")
    call setline(10, "")
    call setline(11, "")
endfunc

" 插入函数头
func SetTitle()
    if &filetype == 'sh'
        call setline(1, "#!/bin/bash")
        call setline(2, "")
        call SetComment_sh()
    endif

    autocmd BufNewFile * normal G                                                                            
endfunc

function SetPyTitle()
    call setline(1, "#!/user/bin/python")
    call setline(2, "# -*- coding: utf-8 -*-")
    call SetComment_sh()

    autocmd BufNewFile * normal G                                                                            
endfunc

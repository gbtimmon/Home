syntax on

" Set numbering by defualt!
set number
set rnu

set backupdir=/tmp

" Set coloring hint
set background=dark

" Add support for the vim syntax files. 
autocmd! BufNewFile,BufRead *.glsl,*.geom,*.vert,*.frag,*.gsh,*.vsh,*.fsh,*.vs,*.fs,*.gs,*.tcs,*.tes set filetype=glsl

" Add support for the .rc files. 
autocmd! BufNewFile,BufRead *.rc set filetype=sh

" Add support for the word wrapping defualt in .notes files 
autocmd BufNewFile,BufRead *.txt *.notes set tw=120


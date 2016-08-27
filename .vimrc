syntax on
set number
set background=dark

" Add support for the vim syntax files. 
autocmd! BufNewFile,BufRead *.glsl,*.geom,*.vert,*.frag,*.gsh,*.vsh,*.fsh,*.vs,*.fs,*.gs,*.tcs,*.tes set filetype=glsl

" Add support for the word wrapping defualt in .notes files 
autocmd BufNewFile,BufRead *.notes set tw=120


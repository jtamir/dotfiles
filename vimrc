" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set autoindent
"set noexpandtab
set tabstop=3
set shiftwidth=3
set softtabstop=3
set hlsearch
set number
set t_Co=256
set tw=120 " line length to be used by the command 'gq'
colorscheme ir_black
filetype on

"" Latex-Suite
"filetype plugin on
"set grepprg=grep\ -nH\ $*
"filetype indent on
"let g:tex_flavor='latex'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
"let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
"let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
"let g:Tex_DefaultTargetFormat='dvi'

" ctags
" LINUX: A-] - Open the definition in a vertical split
" map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" MAC: D-] - Open the definition in a vertical split
 map <D-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags=tags;/

" TagList
nnoremap <silent> <F8> :TlistToggle<CR>
let tlist_tex_settings = 'latex;l:labels;s:sections;t:subsections;u:subsubsections'
"set iskeyword=@,48-57,_,-,:,192-255


" jemdoc
filetype plugin on
augroup filetypedetect
	au! BufNewFile,BufRead *.jemdoc setf jemdoc
augroup END
" Last line is for proper wrapping of jemdoc lists, etc.
autocmd Filetype jemdoc setlocal comments=:#,fb:-,fb:.,fb:--,fb:..,fb:\:

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Tinyos nc syntax highlighting
augroup filetypedetect 
  au! BufRead,BufNewFile *nc setfiletype nc 
augroup END

" EPIC syntax highlighting
au BufReadPost *.e set syntax=c 

" status line modifications
"set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
""set statusline +=%2*0x%04B\ %*          "character under cursor
"hi User1 guifg=#eea040 guibg=#222222
"hi User2 guifg=#dd3333 guibg=#222222
"hi User3 guifg=#ff66ff guibg=#222222
"hi User4 guifg=#a0ee40 guibg=#222222
"hi User5 guifg=#eeee40 guibg=#222222
hi StatusLine ctermbg=white ctermfg=blue
hi StatusLineNC ctermbg=grey ctermfg=white
set laststatus=2

" vimdiff highlighting
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" pathogen
execute pathogen#infect()

" Conque
nnoremap <Leader>ts :ConqueTermSplit bash --rcfile ~/.bash_profile<CR>
nnoremap <Leader>tv :ConqueTermVSplit bash --rcfile ~/.bash_profile<CR>
let g:ConqueTerm_FastMode = 0
let g:ConqueTerm_Color = 1


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


"----------------------------
" For Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
:call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
Plugin 'will133/vim-dirdiff'
Plugin 'jtamir/vim-latex'
Plugin 'jtamir/comments.vim'
Plugin 'jtamir/taglist.vim'
Plugin 'jtamir/ir_black'
Plugin 'tpope/vim-dispatch'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ---------------------------

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
syntax on

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

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Always display the status line, even if only one window is displayed
set laststatus=2

set mouse=a		" Enable mouse usage (all modes)

"set hidden             " Hide buffers when they are abandoned

" Display line numbers on the left
set number

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 

"------------------------------------------------------------
" Indentation options {{{1

" Indentation settings according to personal preference.
 
" Indentation settings for using 8 column tabs
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab " change to expandtab for spaces instead of tabs
  
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4


"------------------------------------------------------------
" Mappings {{{1
" "
" Useful mappings
  
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"set autowrite		" Automatically save before commands like :next and :make
"set t_Co=256
"set tw=120 " line length to be used by the command 'gq'
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
au BufNewFile,BufRead *.e setlocal ft=epic

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

" vimdiff highlighting
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red


" vim-dispatch
map <leader>lr :Start! latexmk -pdf -pdflatex="pdflatex --shell-escape \%O \%S" %<CR>


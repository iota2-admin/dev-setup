"
" @author     Naval Prashar
"
" @date       07-09-2020
" @file       .vimrc
" @brief      iota2 reference .vimrc file
"
" @attention  iota square [i2]
"
" <pre>
" ██╗ ██████╗ ████████╗ █████╗ ██████╗
" ██║██╔═══██╗╚══██╔══╝██╔══██╗╚════██╗
" ██║██║   ██║   ██║   ███████║ █████╔╝
" ██║██║   ██║   ██║   ██╔══██║██╔═══╝
" ██║╚██████╔╝   ██║   ██║  ██║███████╗
" ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝
" </pre>
"
" @copyright   GNU GPU v3
"
" This program is free software; you can redistribute it and/or
" modify it under the terms of the GNU General Public License
" as published by the Free Software Foundation; either version 3
" of the License, or (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" Free Software, Hell Yeah! "
"

source $VIMRUNTIME/defaults.vim

set nocompatible              " be iMproved, required

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'           " let Vundle manage Vundle, required

  "-------------------=== Code/Project navigation ===-------------
  Plugin 'scrooloose/nerdtree'            " Project and file navigation
  Plugin 'majutsushi/tagbar'              " Class/module browser
  Plugin 'kien/ctrlp.vim'                 " Fast transitions on project files

  "-------------------=== Other ===-------------------------------
  Plugin 'bling/vim-airline'              " Lean & mean status/tabline for vim
  Plugin 'vim-airline/vim-airline-themes' " Themes for airline
  Plugin 'Lokaltog/powerline'             " Powerline fonts plugin
  Plugin 'flazz/vim-colorschemes'         " Colorschemes
  Plugin 'morhetz/gruvbox'                " Retro groove color scheme for Vim
  Plugin 'nathanaelkane/vim-indent-guides' " Visually display indent levels in Vim

  "-------------------=== Snippets support ===--------------------
  Plugin 'DoxygenToolkit.vim'             " Doxygen documentation
  Plugin 'tpope/vim-surround'             " Parentheses, brackets, quotes, XML tags, and more
  Plugin 'ntpeters/vim-better-whitespace' " Remove trailing whitespaces

  "-------------------=== Languages support ===-------------------
  Plugin 'Valloric/YouCompleteMe'         " Autocomplete plugin
  Plugin 'vim-scripts/indentpython.vim'   " Python PEP8 indentation
  Plugin 'tmhedberg/SimpylFold'           " Code folding plugin.

  "-------------------=== Python  ===-----------------------------
  " Plugin 'klen/python-mode'             " Python plugin
  Plugin 'scrooloose/syntastic'           " Syntax checking plugin for Vim

call vundle#end()                         " required

"=====================================================
"" Update filetype settings
"=====================================================
filetype on             " Enable file type detection
filetype plugin on      " Enable loading the plugin file for specific file types
filetype indent on      " Enable loading the indent file for specific file types
filetype plugin indent on

"=====================================================
"" Power line settings
"=====================================================
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=Source\ Code\ Pro\ for\ Powerline:h15
    colorscheme PaperColor              " set color scheme
  endif
endif

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
nmap <F8> :TagbarToggle<CR>

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>

"=====================================================
"" gruvbox settings
"=====================================================
let g:solarized_termcolors=256
set background=dark
colorscheme gruvbox

"=====================================================
"" Indent Guids settings
"=====================================================
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2

"=====================================================
"" Doxygen documentation settings
"=====================================================
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns "
let g:DoxygenToolkit_blockHeader="-------------------------------"
let g:DoxygenToolkit_blockFooter="---------------------------------"
let g:DoxygenToolkit_authorName="Naval Prashar"
let g:DoxygenToolkit_licenseTag="GNU GPU v3"

"=====================================================
"" YouCompleteMe
"=====================================================
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>

"=====================================================
"" Trim trailing whitespace
"=====================================================
let g:better_whitespace_ctermcolor='red'
let g:better_whitespace_guicolor='red'
autocmd FileType c,cpp,java,html,python,markdown EnableStripWhitespaceOnSave
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"=====================================================
"" SimplyFold Settings
"=====================================================
let g:SimpylFold_docstring_preview=1

"=====================================================
"" General settings
"=====================================================
syntax enable           " Enable syntax highlighting
set number              " Show line numbers
set autoindent          " Indent when moving to the next line while writing code
set ruler               " Always show cursor position
set cursorline          " Show a visual line under the cursor's current line
set showmatch           " Show the matching part of pairs for [] {} ()

set smarttab            " set tabs for a shifttabs logic
set tabstop=2           " Set tabs to have 4 spaces
set expandtab           " Expand tabs into spaces
set shiftwidth=2        " When using >> or << commands, shift line by 4 spaces

let python_highlight_all = 1    " Enable all python syntax highlighting feature

set ttyfast             " terminal acceleration
set enc=utf-8	          " utf-8 by default
set mouse-=a            " Disable Visual Mode on mouse click
set clipboard=unnamed   " Use System Clipboard

set colorcolumn=80      " Show vertical ruler column
highlight ColorColumn ctermbg=0 guibg=lightgrey

set nobackup 	          " no backup files
set nowritebackup       " only in case you don't want a backup file while editing
set noswapfile 	        " no swap files

set exrc                " enable usage of additional .vimrc files from working directory
set secure              " prohibit .vimrc files to execute shell, create files, etc...

"=====================================================
"" Split layout settings
"=====================================================
set splitbelow          " Create new split layout below original.
set splitright          " Create new split layout right of original.
"split navigations
nnoremap <C-J> <C-W><C-J>   " move to the split below
nnoremap <C-K> <C-W><C-K>   " move to the split above
nnoremap <C-L> <C-W><C-L>   " move to the split to the right
nnoremap <C-H> <C-W><C-H>   " move to the split to the left

"=====================================================
"" Python Syntax settings
"=====================================================
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python']


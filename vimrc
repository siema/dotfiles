"===== Vundle =====
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Main Vundle plugin
Plugin 'VundleVim/Vundle.vim'

" GitHub plugins
Plugin 'bumaociyuan/vim-swift'
Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'kien/ctrlp.vim'
Plugin 'tfnico/vim-gradle'
Plugin 'darfink/vim-plist'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'shime/vim-livedown'
Plugin 'udalov/kotlin-vim'
Plugin 'jlanzarotta/bufexplorer'

" vim.org/vim-scripts.org plugins
Plugin 'AfterColors.vim'

call vundle#end()
filetype plugin indent on
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

"===== colors =====
syntax on
set t_Co=256
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
hi Normal ctermbg=none     " don't override background

"===== general stuff =====
set hidden                 " allow hiding of buffers
set history=1000
set number
set ruler
set showcmd
set incsearch
set scrolloff=5
set splitright
set timeoutlen=100
set fillchars=fold:\ ,
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set backspace=indent,eol,start
set tildeop
"set nowrap
set mouse=a
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set modeline
set modelines=1

"===== some commonly misstyped commands =====
command -bang -nargs=? -complete=file E e<bang> <args>
command -bang -nargs=? -complete=file W w<bang> <args>
command -bang -nargs=? -complete=file Wq wq<bang> <args>
command -bang -nargs=? -complete=file WQ wq<bang> <args>
command -bang Wa wa<bang>
command -bang WA wa<bang>
command -bang Wqa wqa<bang>
command -bang WQa wqa<bang>
command -bang WQA wqa<bang>
command -bang Q q<bang>
command -bang QA qa<bang>
command -bang Qa qa<bang>

"===== vim-airline =====
let g:airline_powerline_fonts = 1               " fancy > and < with powerline-patched font
set noshowmode                                  " hide default mode indicator, airline shows this
set laststatus=2                                " Always display the statusline in all windows
set timeoutlen=50                               " no delay after exitting insert mode

"===== vim-bufferline =====
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
highlight bufferlineActive ctermfg=7 ctermbg=18 guifg=#d8d8d8 guibg=#282828
highlight bufferlineInactive ctermfg=8 ctermbg=18 guifg=#585858 guibg=#282828
let g:bufferline_active_highlight = 'bufferlineActive'
let g:bufferline_inactive_highlight = 'bufferlineInactive'

"===== ctrlp.vim =====
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(zip|gz|7z|rar|exe|a|so|dll|mp3|flac|m4a|jpg|png|gif|psd|mkv|avi|iso)$',
    \ }

"===== gui config =====
if has("gui_running")
    set columns=120 lines=40
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
endif


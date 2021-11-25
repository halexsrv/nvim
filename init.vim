" Custom configuration from NeoVim

" Install vim-plug if not exists
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugin manager
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Set relative numbers
set number relativenumber

" Enable syntax highlighting
syntax on

" Set cursor highlight
set cursorline

" Enable mouse
set mouse=a

" Render whitespace
set list listchars=tab:\·\·,trail:·,eol:¬,space:·

" Enable status line
set laststatus=2

" Identify file type
filetype plugin on

" Define global tabs
set tabstop=2 shiftwidth=2 expandtab

" Define custom tabs for golang
autocmd FileType go setlocal expandtab shiftwidth=8 tabstop=8

" Define custom tabs for ruby and rails
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2

" Disable backup e swap files
set nobackup
set noswapfile

" Set backgroung color, dark or light
set background=dark

" Remap leader key
:let mapleader = ","

" Custom map keys for move lines UP and DOWN
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Custom map keys for maintenance vim
nnoremap <leader>ev :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ip :PlugInstall<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>rv :source ~/.config/nvim/init.vim<CR> :PlugInstall<CR>

" NERDTree toogle
"map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>

" NERDTree custom arrow
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Navigation between buffers
nnoremap <M-Right> :bn<cr>
nnoremap <M-Left> :bp<cr>
nnoremap <c-x> :bp\|bd #<cr>

" Set theme
colorscheme gruvbox
"colorscheme solarized8

" Set gui font
"set guifont=Fira\ Code:h12
set guifont=DroidSansMono\ Nerd\ Font\ Mono:h12
set encoding=utf8

"set laststatus=2
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
"let g:airline_theme='base16_twilight'

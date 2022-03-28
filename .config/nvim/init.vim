"                                                                      
"     $$$$$$\  $$\   $$\  $$$$$$$\  $$$$$$\   $$$$$$\   $$$$$$$\  $$$$$$\  
"    $$  __$$\ $$ |  $$ |$$  _____|$$  __$$\  \____$$\ $$  _____|$$  __$$\ 
"    $$ |  \__|$$ |  $$ |\$$$$$$\  $$ /  $$ | $$$$$$$ |$$ /      $$$$$$$$ |
"    $$ |      $$ |  $$ | \____$$\ $$ |  $$ |$$  __$$ |$$ |      $$   ____|
"    $$ |      \$$$$$$$ |$$$$$$$  |$$$$$$$  |\$$$$$$$ |\$$$$$$$\ \$$$$$$$\ 
"    \__|       \____$$ |\_______/ $$  ____/  \_______| \_______| \_______|
"              $$\   $$ |          $$ |                                    
"              \$$$$$$  |          $$ |                                    
"               \______/           \__|                                    
"
"       Personal nvim configuration of Ryan Hoover <ryan@ryspace.xyz>
"
"-------------------------------------------------------------------------------
"
" GENERAL SETTINGS
"
"-------------------------------------------------------------------------------

set expandtab
set tabstop=4
set shiftwidth=4
set hidden
set relativenumber
set number
set termguicolors
set splitbelow
set splitright
set spell
set title
set ignorecase
set smartcase
set nowrap
set signcolumn=yes:2
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files

filetype plugin on

"-------------------------------------------------------------------------------
"
" KEY MAPS
"
"-------------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vb :edit ~/.config/bash/.bashrc<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

inoremap jj <esc>

nnoremap <leader>b :ls<cr>:b<space>

" If file doesn't exist, create it
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"-------------------------------------------------------------------------------
"
" PLUGINS
"
"-------------------------------------------------------------------------------

"  Automatically install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugins')

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/heritage.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/phpactor.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/vimwiki.vim

call plug#end()
doautocmd User PlugLoaded

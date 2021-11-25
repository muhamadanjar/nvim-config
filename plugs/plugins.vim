" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    " Plug 'scrooloose/NERDTree'
    " Plug 'scrooloose/nerdcommenter'

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'

    Plug 'tpope/vim-fugitive'

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Auto pairs for '(' '[' '{'
    "Plug 'jiangmiao/auto-pairs'
    "
    Plug 'windwp/nvim-autopairs'
    Plug 'joshdick/onedark.vim'
    " Stable version of coc
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

    Plug 'morhetz/gruvbox'
    "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    "Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " Plug 'norcalli/nvim-colorizer.lua'
    
    Plug 'lilydjwg/colorizer'
    Plug 'airblade/vim-gitgutter'


    Plug 'natebosch/vim-lsc'
    Plug 'natebosch/vim-lsc-dart'


call plug#end()

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -------------------------------
  -- LSP
  -------------------------------
  use "neovim/nvim-lspconfig"
  use "glepnir/lspsaga.nvim"
  use "kabouzeid/nvim-lspinstall"

  -------------------------------
  -- Functionality
  -------------------------------

  -- Have the file system follow you
  use 'airblade/vim-rooter'

  -- Search functionality
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'jremmen/vim-ripgrep'

  -- Whichkey
  use 'folke/which-key.nvim'

  -- Git
  use 'tpope/vim-fugitive'  
  use 'kdheepak/lazygit.nvim'

  -------------------------------
  -- Optics
  -------------------------------

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Airline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Icons
  use 'ryanoasis/vim-devicons'
  use 'airblade/vim-gitgutter'

  -- Colorschemes
  use 'ChristianChiarulli/nvcode-color-schemes.vim'

  use 'norcalli/nvim-colorizer.lua'
end)


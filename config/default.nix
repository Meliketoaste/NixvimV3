{ pkgs, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./modules/catppuccin
    ./modules/treesitter
    ./modules/telescope
    ./modules/which-key
    ./modules/lualine
    ./modules/undoTree
    ./modules/oil
    ./modules/lsp
    ./modules/nvim-cmp

    ./sets.nix
    
  ];

    #globals.mapleader = " ";
    #options = {
    #  updatetime = 100; # Faster completion

    #  number = true;
    #  relativenumber = true;

    #  autoindent = true;
    #  clipboard = "unnamedplus";
    #  expandtab = true;
    #  shiftwidth = 2;
    #  smartindent = true;
    #  tabstop = 2;

    #  ignorecase = true;
    #  incsearch = true;
    #  smartcase = true;

    #  swapfile = false;
    #  undofile = true; # Build-in persistent undo
    #};
    #    extraConfigLua =
    #  # lua
    #  ''
    #    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
    #  '';

    #luaLoader.enable = true;

    # Highlight and remove extra white spaces
    #highlight.ExtraWhitespace.bg = "red";
    #match.ExtraWhitespace = "\\s\\+$";
}

{ pkgs, ... }:
let
  nu-grammar = pkgs.tree-sitter.buildGrammar {
    language = "nu";
    version = "0.0.0+rev=358c4f5";
    src = pkgs.fetchFromGitHub {
      owner = "nushell";
      repo = "tree-sitter-nu";
      rev = "2d0dd587dbfc3363d2af4e4141833e718647a67e";
      hash = "sha256-A0Lpsx0VFRYUWetgX3Bn5osCsLQrZzg90unGg9kTnVg=";
    };
  };
in {

  #extraConfigLua = ''

  #  require("which-key").register({
  #    g = {
  #      name = "Go",
  #      H = {
  #        "<cmd>TSHighlightCapturesUnderCursor<cr>", "Show Tree-sitter Captures"
  #      },
  #    },
  #    t = {
  #      name = "Toggle",
  #      p = { "<cmd>TSPlaygroundToggle<cr>", "Toggle Tree-sitter Playground" }
  #    }
  #  }, { mode = "n", noremap = true, silent = true })
  #'';

  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
    };
  };
}

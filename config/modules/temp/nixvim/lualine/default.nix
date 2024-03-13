{
  lib,
  pkgs,
  ...
}:
with lib.plusultra; {
  config = {
    extraPlugins = with pkgs.vimPlugins; [
      # nvim-navic
      neodev-nvim
    ];

    extraConfigLuaPre = ''
      require("neodev").setup {
        lspconfig = true,
        library = {
          enabled = true,
          plugins = true,
          runtime = true,
          types = true,
        },
      }

      -- require("nvim-navic").setup {
      --   icons = {
      --     File          = "󰈙 ",
      --     Module        = " ",
      --     Namespace     = "󰌗 ",
      --     Package       = " ",
      --     Class         = "󰌗 ",
      --     Method        = "󰆧 ",
      --     Property      = " ",
      --     Field         = " ",
      --     Constructor   = " ",
      --     Enum          = "󰕘",
      --     Interface     = "󰕘",
      --     Function      = "󰊕 ",
      --     Variable      = "󰆧 ",
      --     Constant      = "󰏿 ",
      --     String        = "󰀬 ",
      --     Number        = "󰎠 ",
      --     Boolean       = "◩ ",
      --     Array         = "󰅪 ",
      --     Object        = "󰅩 ",
      --     Key           = "󰌋 ",
      --     Null          = "󰟢 ",
      --     EnumMember    = " ",
      --     Struct        = "󰌗 ",
      --     Event         = " ",
      --     Operator      = "󰆕 ",
      --     TypeParameter = "󰊄 ",
      --   },
      --   lsp = {
      --     auto_attach = true,
      --   },
      --   highlight = false,
      --   separator = " ⇢ ",
      --   depth_limit = 0,
      --   depth_limit_indicator = "..",
      --   safe_output = true
      -- }
    '';

    extraConfigLua = ''
    '';

    #options = {
    #  laststatus = 3;
    #};

    plugins = {
      # lsp = {
      #   onAttach = ''
      #     if client.server_capabilities.documentSymbolProvider then
      #       require("nvim-navic").attach(client, bufnr)
      #     end
      #   '';
      # };

      lualine = {
        enable = true;
      };
    };
  };
}

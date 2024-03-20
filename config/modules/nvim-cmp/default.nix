{lib, pkgs, ...}: {
  #extraPlugins = with pkgs.vimPlugins; [
  #  luasnip
  #];
  plugins.luasnip = {
    enable = true;
    extraConfig = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
    fromVscode = [
      {
        lazyLoad = true;
        paths = "${pkgs.vimPlugins.friendly-snippets}";
      }
    ];
  };
  extraConfigLua = ''
    luasnip = require("luasnip")
  '';

  plugins = {
    cmp-nvim-lsp = {enable = true;}; # lsp
    cmp-buffer = {enable = true;};
    #copilot-cmp = {enable = true;}; # copilot suggestions
    cmp-path = {enable = true;}; # file system paths
    cmp_luasnip = {enable = true;}; # snippets
    cmp-cmdline = {enable = false;}; # autocomplete for cmdline
    nvim-cmp = {
      enable = true;

      snippet.expand = "luasnip";

      mappingPresets = ["insert"];

      sources = [
        #{
        #  name = "copilot";
        #  groupIndex = 1;
        #  priority = 4;
        #}
        {
          name = "nvim_lsp";
          groupIndex = 1;
          priority = 3;
        }
        {
          name = "luasnip";
          option = {
            show_autosnippets = true;
          };
          groupIndex = 1;
          priority = 5;
        }
        {
          name = "path";
          groupIndex = 1;
        }
        {
          name = "buffer";
          groupIndex = 2;
          priority = 2;
        }
      ];
      mapping = {
        "<Tab>" = {
          modes = ["i" "s"];
          action = ''
            function(fallback)
              if cmp.visible() then
            		cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
                    end
              end
          '';
        };
        "<S-Tab>" = {
          modes = ["i" "s"];
          action = ''
                 function(fallback)
            	if cmp.visible() then
            		cmp.select_prev_item()
            	elseif luasnip.jumpable(-1) then
            		luasnip.jump(-1)
            	else
            		fallback()
            	end
            end
          '';
        };
        "<C-j>" = {
          action = "cmp.mapping.select_next_item()";
        };
        "<C-k>" = {
          action = "cmp.mapping.select_prev_item()";
        };
        "<C-e>" = {
          action = "cmp.mapping.abort()";
        };
        "<C-b>" = {
          action = "cmp.mapping.scroll_docs(-4)";
        };
        "<C-f>" = {
          action = "cmp.mapping.scroll_docs(4)";
        };
        "<C-Space>" = {
          action = "cmp.mapping.complete()";
        };
        "<CR>" = {
          action = "cmp.mapping.confirm({ select = true })";
        };
        "<S-CR>" = {
          action = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };
  };
}

{ lib, pkgs, ... }:

{
  plugins = {
    lsp = {
      enable = true;

      #onAttach = ''
      #  do
      #    local lsp = require("lspconfig")
      #    local which_key = require("which-key")

      #    -- See `:help vim.lsp.*` for documentation on any of the below functions
      #    which_key.register({
      #      g = {
      #        name = "Go",
      #        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
      #        D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
      #        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
      #        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to implementation" },
      #        -- n = { "<cmd>lua require('illuminate').next_reference{wrap=true}<cr>", "Go to next occurrence" },
      #        -- p = { "<cmd>lua require('illuminate').next_reference{reverse=true,wrap=true}<cr>", "Go to previous occurrence" },
      #        r = { "<cmd>lua vim.lsp.buf.references()<cr>", "Go to references" },
      #        -- t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Go to type definition" },
      #        ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" }
      #      },
      #      ["["] = {
      #        d = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
      #      },
      #      ["]"] = {
      #        d = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
      #      },
      #    }, { buffer = buffer, mode = "n", noremap = true, silent = true })

      #    which_key.register({
      #      w = {
      #        name = "Workspace",
      #        a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace" },
      #        l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List workspaces" },
      #        r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace" },
      #      },
      #      c = {
      #        name = "Code",
      #        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action" },
      #        f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
      #        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      #      }
      #    }, { buffer = buffer, mode = "n", prefix = "<leader>", noremap = true, silent = true })

      #    if client.name == "tsserver" then
      #      which_key.register({
      #        c = {
      #          name = "Code",
      #          a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action" },
      #          f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
      #          r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      #          i = {
      #            name = "Imports",
      #            o = { "<cmd>OrganizeImports<cr>", "Organize" },
      #          },
      #        }
      #      }, { buffer = buffer, mode = "n", prefix = "<leader>", noremap = true, silent = true })
      #    end
      #  end
      #'';
      #keymaps = {
      #  diagnostic = {
      #    "]d" = "goto_next";
      #    "[d" = "goto_prev";
      #  };
      #  lspBuf = {
      #    h = "hover";
      #    gK = "signature_help";
      #    gD = "references";
      #    gd = "definition";
      #    gi = "implementation";
      #    gt = "type_definition";
      #    lr = "rename";
      #    ca = "code_action";
      #  };
      #};
      keymaps = {
          silent = true;
          diagnostic = {
            "[d" = {
              action = "goto_prev";
              desc = "Go to prev diagnostic";
            };
            "]d" = {
              action = "goto_next";
              desc = "Go to next diagnostic";
            };
          };

          lspBuf = {
            "<leader>a" = {
              action = "code_action";
              desc = "Code Actions";
            };
            "<leader>r" = {
              action = "rename";
              desc = "Rename Symbol";
            };
            "<leader>F" = {
              action = "format";
              desc = "Format";
            };
            "gd" = {
              action = "definition";
              desc = "Goto definition";
            };
            "gD" = {
              action = "declaration";
              desc = "Goto declaration";
            };
            "gy" = {
              action = "type_definition";
              desc = "Goto Type Defition";
            };
            "gi" = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            "<leader>k" = {
              action = "hover";
              desc = "Hover";
            };
          };
        };

      onAttach = ''
        lsp_attach_custom(client, bufnr);
      '';

      servers = {
        astro.enable = true;
        bashls.enable = true;
        cmake.enable = true;
        clangd.enable = true;
        eslint = {
          enable = true;

          extraOptions = { settings = { autoFixOnSave = true; }; };
        };
        #gopls.enable = true;
         gopls = {
        enable = true;
        onAttach.function = /*lua*/ ''
          if not client.server_capabilities.semanticTokensProvider then
          	local semantic = client.config.capabilities.textDocument.semanticTokens
          	client.server_capabilities.semanticTokensProvider = {
          		full = true,
          		legend = {
          			tokenTypes = semantic.tokenTypes,
          			tokenModifiers = semantic.tokenModifiers,
          		},
          		range = true,
          	}
          end
        '';
        extraOptions = {
          settings = {
            gopls = {
              gofumpt = true;
              codelenses = {
                gc_details = false;
                generate = true;
                regenerate_cgo = true;
                run_govulncheck = true;
                test = true;
                tidy = true;
                upgrade_dependency = true;
                vendor = true;
              };
              hints = {
                assignVariableTypes = true;
                compositeLiteralFields = true;
                compositeLiteralTypes = true;
                constantValues = true;
                functionTypeParameters = true;
                parameterNames = true;
                rangeVariableTypes = true;
              };
              analyses = {
                fieldalignment = true;
                nilness = true;
                unusedparams = true;
                unusedwrite = true;
                useany = true;
              };
              usePlaceholders = true;
              completeUnimported = true;
              staticcheck = true;
              directoryFilters = ["-.git" "-.vscode" "-.idea" "-.vscode-test" "-node_modules"];
              semanticTokens = true;
            };
          };
        };
      };
        html.enable = true;
        jsonls.enable = true;
        lua-ls.enable = true;
        pyright.enable = true;
        pylsp.enable = true;
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        tailwindcss.enable = true;
        #tsserver = {
        #  enable = true;

        #  extraOptions = {
        #    commands = {
        #      OrganizeImports = lua.mkRaw ''
        #        {
        #          function()
        #            vim.lsp.buf.execute_command {
        #              title = "",
        #              command = "_typescript.organizeImports",
        #              arguments = { vim.api.nvim_buf_get_name(0) },
        #            }
        #          end,
        #          description = "Organize Imports",
        #        }
        #      '';
        #    };
        #  };
        #};
        yamlls.enable = true;

        nixd = {
          enable = true;

          settings = {
            formatting.command = "${pkgs.alejandra}/bin/alejandra";
          };
        };
      };
    };
  };

  extraConfigLuaPre = ''
    do
      local diagnostic_signs = { Error = "", Warn = "", Hint = "", Info = "" }

      for type, icon in pairs(diagnostic_signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      })
    end
  '';

}

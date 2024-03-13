{...}: {
  colorschemes.catppuccin = {
    enable = true;
    flavour = "mocha";

    transparentBackground = false;
    integrations.native_lsp.enabled = true;
    colorOverrides.mocha = {
      base = "#11111B";
    };

    #borders = true;
    #contrast = true;
  };
  highlight.NormalFloat.bg = "#11111b";
}

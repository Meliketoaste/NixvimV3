{...}: {
  colorschemes.catppuccin = {
    enable = true;
    flavour = "mocha";

    transparentBackground = false;
    integrations.native_lsp.enabled = true;
    colorOverrides.mocha = {
      base = "#11111B";
      crust = "#0C0C13";
    };

    #borders = true;
    #contrast = true;
  };
}

{...}: {
  config = {
    options = {
      list = true;
      listchars = "eol:↴,nbsp:↲,space: ,tab: ,trail:-";
    };

    plugins = {
      indent-blankline = {
        # Removed
        # showEndOfLine = true;
        # useTreesitter = true;
        # spaceCharBlankline = " ";

        enable = true;
        indent = {
        char = "│";
        #tab_char = "│";
        };

        scope = {
          enabled = false;
          showStart = true;
        };
        exclude = {
          buftypes = ["terminal" "nofile"];
          filetypes = ["help" "dashboard" "NvimTree" "Trouble" "notify"];
        };
      };
    };
  };
}
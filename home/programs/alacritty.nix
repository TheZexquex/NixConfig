{ ... }: {
  programs.alacritty = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      window = {
        startup_mode = "Maximized";
        decorations = "None";
        opacity = 0.9;
        padding = {
          x = 10;
          y = 0;
        };
      };
    };
  };
}

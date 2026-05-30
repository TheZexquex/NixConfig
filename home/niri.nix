{config, ...}: {
  programs.niri = {
    enable = true;
    settings = {
      # Shortcuts / Binds
      binds = with config.lib.niri.actions; {
        "Mod+Q".action = spawn "alacritty";
        "Mod+C".action = close-window;
        "Mod+Shift+E".action = quit;
      };

      # Visuals
      layout = {
        gaps = 16;
        border = {
          width = 2;
          active = "#7fc8ff";
        };
      };

      # Outputs / Displays
      outputs."eDP-1" = {
        scale = 1.5;
      };
    };
  };
}

{ inputs, ... }:
{

  programs.hyprpanel = {
    enable = true; 
    systemd.enable = true;

    # Configure and theme almost all options from the GUI.
    # Options that require '{}' or '[]' are not yet implemented,
    # except for the layout above.
    # See 'https://hyprpanel.com/configuration/settings.html'.
    # Default: <same as gui>
    settings = {
      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;
      bar.clock.format = "%a %b %d  %H:%M:%S ";

      menus.clock = {
        time = {
          military = true;
        };
        weather.unit = "metric";
      };

      layout = {
        "bar.layouts" = {
          "*" = {
            left = [ "dashboard" "workspaces" "windowtitle" ];
            middle = [ "media" ];
            right = [ "volume" "network" "bluetooth" "hyprsunset" "systray" "clock" "notifications" ];
          };
        };
      };

      theme = {
        name = "catppuccin_macchiato";
        bar.transparent = false;
        font = {
          name = "Ubuntu Nerd Font";
          size = "16px";
        };
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true; 
    };

   
  };
}

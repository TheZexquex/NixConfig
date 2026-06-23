{pkgs, ...}: {
  programs.niri = {
    enable = true;
    settings = {
      input = {
        keyboard.xkb.layout = "de";
      };

      outputs = {
        "DP-3" = {
          mode = {
            width = 2560;
            height = 1440;
            refresh = 144.0;
          };
          position = {
            x = 0;
            y = 0;
          };
        };
        "DP-2" = {
          mode = {
            width = 2560;
            height = 1440;
            refresh = 144.0;
          };
          position = {
            x = 2560;
            y = 0;
          };
        };
        "HEADLESS-3" = {
          mode = {
            width = 1920;
            height = 1080;
          };
          position = {
            x = 0;
            y = 0;
          };
        };
      };

      layout = {
        gaps = 10;

        focus-ring.enable = false;
        border.enable = false;
      };

      spawn-at-startup = [
        {
          command = [
            "sh"
            "-c"
            "xsetroot -cursor_name Future || true"
          ];
        }

        {command = ["pear-desktop"];}
      ];

      # Keybindings
      binds = let
        mod = "Mod";
      in {
        # Terminals & Browser
        "${mod}+Q".action.spawn = "alacritty";
        "${mod}+B".action.spawn = "firefox";
        "${mod}+V".action.spawn = [
          "vicinae"
          "vicinae://launch/clipboard/history"
        ];
        "${mod}+Space".action.spawn = [
          "vicinae"
          "toggle"
        ];

        # Screenshots
        "Print".action.spawn = [
          "hyprshot"
          "--freeze"
          "--mode"
          "region"
          "-o"
          "~/Pictures/Screenshots"
        ];
        "${mod}+Print".action.spawn = [
          "hyprshot"
          "-m"
          "output"
          "-m"
          "active"
          "-o"
          "~/Pictures/Screenshots"
        ];

        # Session Management
        "${mod}+L".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "sessionMenu"
          "lock"
        ];
        "${mod}+Alt+End".action.quit = {
          skip-confirmation = true;
        };

        "${mod}+C".action.close-window = [];
        "${mod}+F".action.maximize-column = [];
        "${mod}+Shift+F".action.fullscreen-window = [];

        "${mod}+Left".action.focus-column-left = [];
        "${mod}+Right".action.focus-column-right = [];
        "${mod}+Up".action.focus-window-or-workspace-up = [];
        "${mod}+Down".action.focus-window-or-workspace-down = [];

        "${mod}+Shift+Left".action.move-column-left = [];
        "${mod}+Shift+Right".action.move-column-right = [];
        "${mod}+Shift+Up".action.move-window-up = [];
        "${mod}+Shift+Down".action.move-window-down = [];

        "${mod}+Ctrl+Left".action.focus-monitor-left = [];
        "${mod}+Ctrl+Right".action.focus-monitor-right = [];

        "${mod}+1".action.focus-workspace = 1;
        "${mod}+2".action.focus-workspace = 2;
        "${mod}+3".action.focus-workspace = 3;
        "${mod}+4".action.focus-workspace = 4;
        "${mod}+5".action.focus-workspace = 5;
        "${mod}+6".action.focus-workspace = 6;
        "${mod}+7".action.focus-workspace = 7;
        "${mod}+8".action.focus-workspace = 8;
        "${mod}+9".action.focus-workspace = 9;
        "${mod}+0".action.focus-workspace = 10;

        "${mod}+Shift+1".action.move-window-to-workspace = 1;
        "${mod}+Shift+2".action.move-window-to-workspace = 2;
        "${mod}+Shift+3".action.move-window-to-workspace = 3;
        "${mod}+Shift+4".action.move-window-to-workspace = 4;
        "${mod}+Shift+5".action.move-window-to-workspace = 5;
        "${mod}+Shift+6".action.move-window-to-workspace = 6;
        "${mod}+Shift+7".action.move-window-to-workspace = 7;
        "${mod}+Shift+8".action.move-window-to-workspace = 8;
        "${mod}+Shift+9".action.move-window-to-workspace = 9;
        "${mod}+Shift+0".action.move-window-to-workspace = 10;

        "${mod}+M".action.focus-workspace = 11;
      };

      window-rules = [
        {
          matches = [
            {
              app-id = "^jetbrains-.*$";
              title = "^(Splash|Welcome to.*)$";
            }
          ];
          open-floating = true;
        }

        {
          matches = [{app-id = "^com.github.th_ch.youtube_music$";}];
        }

        {
          matches = [{app-id = "^.*pulsemeeter.*$";}];
          open-floating = true;
        }

        {
          matches = [{app-id = "^pear-desktop$";}];
        }
      ];
    };
  };
}

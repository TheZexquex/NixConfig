{ pkgs, inputs, ... }: {
  
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      env = [
        "GNOME_KEYRING_CONTROL,$XDG_RUNTIME_DIR/keyring"
        "SSH_AUTH_SOCK,$XDG_RUNTIME_DIR/keyring/ssh"
      ];
      general = {
        border_size = 3;
        gaps_in = 4;
        gaps_out = 10;
        "col.active_border" = "rgb(ed8796) rgb(c6a0f6) 45deg";
        "col.inactive_border" = "rgb(91d7e3) rgb(b7bdf8) 45deg";
      };

      decoration = {
        rounding = 4;
      };

      exec-once = [
        "swww-daemon && swww img ~/Pictures/wallpapers/wallpaper-hy.png"
        "clipse -listen"
        "hyprctl setcursor Future 20"
        "hyprpanel"
      ];

      monitor = [
        "DP-3, 2560x1440, 0x0, 1"
        "DP-2, 2560x1440, 2560x0, 1"
      ];

      animation = [
        "windows, 1, 3, default, popin"
        "workspaces, 1, 3, default"
      ];

      "$mod" = "SUPER";
      bind = [
        "$mod, Print, exec, wayfreeze --after-freeze-cmd 'grim -g \"$(slurp -o)\" -t ppm - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/Screenshot-$(date '+%Y%m%d-%H:%M:%S').png'"
        ",Print, exec, filename=~/Pictures/Screenshots/Screenshot_$(date +%Y-%m-%d_%H-%M-%S).png && grim -g \"$(slurp -o)\" -t png \"$filename\" && wl-copy --type image/png < \"$filename\""
        "$mod, V, exec, alacritty --class clipse -e 'clipse'"
        "$mod, B, exec, firefox"
        "$mod, Q, exec, alacritty"
        "$mod, M, exit"
        "$mod, L, exec, hyprlock"

        "$mod, C, killactive"
        "$mod, F, fullscreen"
        "$mod, W, togglefloating"

        "$mod, space, exec, rofi -show drun"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "SUPER SHIFT, left, movewindow, l"
        "SUPER SHIFT, right, movewindow, r"
        "SUPER SHIFT, up, movewindow, u"
        "SUPER SHIFT, down, movewindow, d"

        "SUPER CTRL, left, movewindow, mon:l"
        "SUPER CTRL, right, movewindow, mon:r"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      input = {
        kb_layout = "de";
      };

      # -- Fix odd behaviors in IntelliJ IDEs --
      windowrule = [
        # "opacity 0.9,class:negative:^(firefox|Minecraft.*)$"
        #! Fix focus issues when dialogs are opened or closed
        #"windowdance,class:^(jetbrains-.*)$,floating:1"
        #! Fix splash screen showing in weird places and prevent annoying focus takeovers
        ##"center,class:^(jetbrains-.*)$,title:^(splash)$,floating:1"
        ##"nofocus,class:^(jetbrains-.*)$,title:^(splash)$,floating:1"
        ##"noborder,class:^(jetbrains-.*)$,title:^(splash)$,floating:1"

        
        #! Center popups/find windows
        ##"center,class:^(jetbrains-.*)$,title:^( )$,floating:1"
        ##"stayfocused,class:^(jetbrains-.*)$,title:^( )$,floating:1"
        ##"noborder,class:^(jetbrains-.*)$,title:^( )$,floating:1"
        #! Disable window flicker when autocomplete or tooltips appear
        #"nofocus,class:^(jetbrains-.*)$,title:^(win.*)$,floating:1"

        "noinitialfocus, class:^(.*jetbrains.*)$, title:^(win.*)$"
        "nofocus, class:^(.*jetbrains.*)$, title:^(win.*)$
        # fix tab dragging (always have a single space character as their title)"
        "noinitialfocus, class:^(.*jetbrains.*)$, title:^\\s$"
        "nofocus, class:^(.*jetbrains.*)$, title:^\\s$"

        "size 622 652,class:(clipse)"
        #"size 622 652,class:(satty)"
        "float,class:(clipse)"
        #"float,class:(satty)"
      ];  
    };
  };
}

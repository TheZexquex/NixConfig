{ pkgs, inputs, ... }: {
  
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      general = {
        border_size = 4;
        "col.active_border" = "rgb(ed8796) rgb(c6a0f6) 45deg";
        "col.inactive_border" = "rgb(91d7e3) rgb(b7bdf8) 45deg";
      };

      decoration = {
        rounding = 8;
      };

      exec-once = [
        "swww-daemon && swww img ~/Pictures/wallpapers/wallpaper.png"
        "hyprpanel"
      ];

      monitor = [
        "DP-5, 2560x1440, 0x0, 1"
        "DP-4, 2560x1440, 2560x0, 1"
      ];

      animation = [
        "windows, 1, 3, default, popin"
        "workspaces, 1, 3, default"
      ];

      "$mod" = "SUPER";
      bind = [
        "$mod, B, exec, firefox"
        "$mod, Q, exec, alacritty"
        "$mod, M, exit"

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
    };
  };
}

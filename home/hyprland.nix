{...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    xwayland.enable = true;
    systemd.enable = false;

    settings = {
      general = {
        border_size = 0;
        gaps_in = 4;
        gaps_out = 10;
        "col.active_border" = "rgb(ed8796) rgb(c6a0f6) 45deg";
        "col.inactive_border" = "rgb(91d7e3) rgb(b7bdf8) 45deg";
      };

      decoration = {
        rounding = 6;
      };

      exec-once = [
        # "dbus-update-activation-environment --systemd SSH_AUTH_SOCK"
        "hyprctl setcursor Future 20"
        "udiskie &"

        # Autostart special workspaces
        "[workspace 2 silent] pear-desktop"
        "[workspace 2 silent] discord"
      ];

      monitor = [
        "DP-3, 2560x1440@144, 0x0, 1, vrr, 0"
        "DP-2, 2560x1440@144, 2560x0, 1, vrr, 0"
        "HEADLESS-3, 1920x1080, 0x0, 1"
      ];

      animation = [
        "windows, 1, 3, default, popin"
        "workspaces, 1, 3, default"
        "specialWorkspace, 1, 8, default, slide bottom"
      ];

      "$mod" = "SUPER";
      bind = [
        ", Print, exec, hyprshot --freeze --mode region -o ~/Pictures/Screenshots"
        "$mod, Print, exec, hyprshot -m output -m active -o ~/Pictures/Screenshots"
        "$mod, V, exec, vicinae vicinae://launch/clipboard/history"
        "$mod, B, exec, firefox"
        "$mod, Q, exec, alacritty"
        "$mod ALT, END, exit"
        "$mod, L, exec, noctalia msg session lock"

        "$mod, C, killactive"
        "$mod, F, fullscreen"
        "$mod, W, togglefloating"

        "$mod, space, exec, vicinae toggle"

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

        "$mod, m, togglespecialworkspace, music"

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

        "SUPER, R, pass, class:^(com\.obsproject\.Studio)$"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      input = {
        kb_layout = "de";
        follow_mouse = 1;
      };

      windowrule = [
        # == Jetbrains IDEs start ==
        # Centered splash screens
        "match:class ^upc.exe$, float on, center on"
        "match:class ^jetbrains-.*$, match:title ^(Splash|Welcome to.*)$, float on"
        "match:class ^jetbrains-.*$, match:title ^(Splash|Welcome to.*)$, center on"

        # Stop losing focus in popups on mouse move
        #"match:class ^jetbrains-.*$, no_follow_mouse on"
        # == Jetbrains IDEs end ==
        "match:class ^(.*obsidian.*)$, float on, center on, pin on"
        "match:class ^(.*pulsemeeter.*)$, float on, center on"
      ];
    };
  };
}

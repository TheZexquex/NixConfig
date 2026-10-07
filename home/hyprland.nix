{...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    xwayland.enable = true;
    systemd.enable = false;

    extraConfig = builtins.readFile ./hyprland.lua;
  };
}

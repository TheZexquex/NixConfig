{
  lib,
  osConfig,
  ...
}: let
  hostConfig = ./hosts + "/${osConfig.networking.hostName}.lua";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    xwayland.enable = true;
    systemd.enable = false;

    extraConfig =
      lib.optionalString (builtins.pathExists hostConfig) (builtins.readFile hostConfig + "\n")
      + builtins.readFile ./hyprland.lua;
  };
}

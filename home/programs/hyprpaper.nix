{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = false;
    settings = {
      preload = [
        "~/Pictures/wallpapers/wallpaper-hy.png"
      ];
      wallpaper = [
        "DP-1,~/Pictures/wallpapers/wallpaper-hy.png"
        "DP-2,~/Pictures/wallpapers/wallpaper-hy.png"
        "DP-3,~/Pictures/wallpapers/wallpaper-hy.png"
        "DP-4,~/Pictures/wallpapers/wallpaper-hy.png"
        "DP-5,~/Pictures/wallpapers/wallpaper-hy-png"
      ];
    };
  };
}

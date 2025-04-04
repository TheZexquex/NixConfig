{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/Pictures/wallpapers/wallpaper.jpg"
      ];
      wallpaper = [
        "DP-4,~/Pictures/wallpapers/wallpaper.jpg"
        "DP-5,~/Pictures/wallpapers/wallpaper.jpg"
      ];
    };
  };
}

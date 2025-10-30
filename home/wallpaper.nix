{ config, pkgs, lib, ... }:

let
  script = pkgs.writeShellScriptBin "apply-colors-from-wallpaper" ''
    #!/usr/bin/env bash
    WALL=$(cat "$HOME/.cache/swww/DP-2")

    wpg -s "$WALL" -n

    pkill -SIGUSR2 waybar || true
  '';
in {
  home.packages = with pkgs; [
    swww
    pywal
    waypaper
    script
  ];

  services.swww = {
    enable = true;
    package = pkgs.swww;
  };

  systemd.user.services.swww-wallpaper = {
    Unit = {
      Description = "Run pywal + Waybar reload after wallpaper change";
      After = [ "swww-daemon.service" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${script}/bin/apply-colors-from-wallpaper";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  systemd.user.paths.swww-wallpaper = {
    Unit = {
      Description = "Watch for swww wallpaper change";
    };
    Path = {
      PathChanged = "%h/.cache/swww/current";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}


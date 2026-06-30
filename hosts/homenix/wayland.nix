{
  pkgs,
  lib,
  ...
}: let
  sddm-noctalia-bg-path = "/var/lib/sddm";
  sddm-noctalia-bg-name = "noctalia-background.jpg";
  sddm-astronaut =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "japanese_aesthetic";
      themeConfig = {
        # HeaderTextColor = "#d5c4a1";
        Background = "Backgrounds/${sddm-noctalia-bg-name}";
      };
    }).overrideAttrs
    (oldAttrs: {
      #Optional: Inject custom background image
      installPhase =
        oldAttrs.installPhase
        + ''
          cd $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds
          chmod u+w .
          ln -s "${sddm-noctalia-bg-path}/${sddm-noctalia-bg-name}" "${sddm-noctalia-bg-name}"
        '';
    });
in {
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  services.displayManager.dms-greeter = {
    enable = false;
    compositor.name = "hyprland";
  };

  systemd.services.sync-noctalia-wallpaper = {
    description = "Copies the currently selected noctalia wallpaper to the sddm background folder";
    after = ["home-manager.service"];
    wantedBy = ["multi-user.target" "sleep.target"];

    path = with pkgs; [
      jq
    ];

    script = ''
      USER_HOME="/home/thezexquex/"
      STATE_FILE="$USER_HOME/.cache/noctalia/wallpapers.json"
      TARGET_DIR="${sddm-noctalia-bg-path}"
      TARGET_IMG="$TARGET_DIR/${sddm-noctalia-bg-name}"

      if [ -f "$STATE_FILE" ]; then
      	WP_PATH=$(jq -r ".wallpapers.\"\".dark" $STATE_FILE )

      	if [ -f "$WP_PATH" ]; then
      	  mkdir -p "$TARGET_DIR"
      		cp "$WP_PATH" "$TARGET_IMG"
      		chmod 644 "$TARGET_IMG"
      	fi
      fi
    '';

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    package = lib.mkForce pkgs.kdePackages.sddm;
    wayland.enable = true;
    extraPackages = with pkgs; [
      sddm-astronaut
      kdePackages.qtmultimedia # Required for video backgrounds/audio
    ];
    theme = "${sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
  };
  services.desktopManager.plasma6.enable = true;
  services.displayManager.gdm.enable = false; # broken

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
    # set the flake package
    #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    #portalPackage =  inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];

    config.common.default = "gtk";
  };
}

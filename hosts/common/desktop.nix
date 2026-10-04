{pkgs, ...}: {
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  services.displayManager.plasma-login-manager = {
    enable = true;
  };

  services.desktopManager.plasma6.enable = false;
  services.displayManager.gdm.enable = false; # broken

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];

    config.common.default = ["gtk" "hyprland"];
  };

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "inode/directory" = ["nautilus.desktop"];
    };
  };
}

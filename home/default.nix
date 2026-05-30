{pkgs, ...}: {
  imports = [
    ./programs
    ./packages.nix
    ./hyprland.nix
    ./niri.nix
    ./gtk.nix
    ./qt.nix
  ];

  nixpkgs.config.allowUnfree = true;

  catppuccin = {
    enable = true;
    hyprland.enable = false;
    accent = "peach";
    flavor = "macchiato";
  };

  home = {
    username = "thezexquex";
    homeDirectory = "/home/thezexquex";

    keyboard.layout = "de";

    sessionVariables = {
      EDITOR = "nvim";
      GNOME_KEYRING_CONTROL = "$XDG_RUNTIME_DIR/keyring";
    };

    stateVersion = "24.11";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];

    config.common.default = "gtk";
  };

  programs.home-manager.enable = true;
}

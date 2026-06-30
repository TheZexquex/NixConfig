{pkgs, ...}: {
  imports = [
    ./programs
    ./packages.nix
    ./hyprland.nix
    ./niri.nix
    ./theme.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];

  catppuccin = {
    enable = false;
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
      GTK_THEME = "adw-gtk3-dark";
    };

    stateVersion = "24.11";
  };

  systemd.user.sessionVariables = {
    QML2_IMPORT_PATH = pkgs.lib.mkForce "/home/thezexquex/.nix-profile/lib/qt-6/qml:/home/thezexquex/.nix-profile/lib/qt-5.15.18/qml";
  };

  programs.home-manager.enable = true;
}

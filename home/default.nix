{
  pkgs,
  osConfig,
  ...
}: {
  imports = let
    hostName = osConfig.networking.hostName;
  in
    [
      ./programs
      ./hyprland.nix
      #./niri.nix
      ./theme.nix

      ../home/packages/shared.nix
    ]
    ++ (
      if hostName == "homenix"
      then [../home/packages/homenix.nix]
      else []
    )
    ++ (
      if hostName == "travelnix"
      then [../home/packages/travelnix.nix]
      else []
    );

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];

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

{ pkgs, inputs, catppuccin, ... }: {
  
  imports = [
    ./programs
    ./packages.nix
    ./hyprland.nix
    ./gtk.nix
  ];

  nixpkgs.config.allowUnfree = true;

  catppuccin = {
    enable = true;
    accent = "peach";
    flavor = "macchiato";
  };

  home = {
    username = "thezexquex";
    homeDirectory = "/home/thezexquex";

    keyboard.layout = "de";

    sessionVariables = {
      EDITOR = "lvim";
      GNOME_KEYRING_CONTROL = "$XDG_RUNTIME_DIR/keyring";
      SSH_AUTH_SOCK = "";
    };

    stateVersion = "24.11";
  };


  programs.home-manager.enable = true;
}

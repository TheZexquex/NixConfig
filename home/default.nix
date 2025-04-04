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
    };

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}

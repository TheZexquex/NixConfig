{
  description = "TheZexquex' super cool NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";

    catppuccin-gtk = {
      url = "github:Fausto-Korpsvart/Catppuccin-GTK-Theme";
      flake = false;
    };
    
    swww.url = "github:LGFae/swww";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, catppuccin, home-manager, hyprpanel, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
    nixosConfigurations.homenix = nixpkgs.lib.nixosSystem { 
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./hosts/homenix
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
      ];
    };
  };
}

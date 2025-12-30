{
  description = "TheZexquex' super cool NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:Nixos/nixpkgs/nixos-25.05";
    catppuccin.url = "github:catppuccin/nix";
    vicinae.url = "github:vicinaehq/vicinae";
    affinity-nix.url = "github:mrshmllow/affinity-nix";

    catppuccin-gtk = {
      url = "github:Fausto-Korpsvart/Catppuccin-GTK-Theme";
      flake = false;
    };
    
    awww.url = "git+https://codeberg.org/LGFae/awww";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";

    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, catppuccin, home-manager, hyprpanel, ... }@inputs:
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

        ({ pkgs, ... }: {
          nixpkgs.overlays = [ 
          (final: _prev: {
            stable = import inputs.nixpkgs-stable {
              system = final.system;
                config = {
                  allowUnfree = true;
                  permittedInsecurePackages = [ ];
                };
              };
            })
          ];
        })
      ];
    };
  };
}

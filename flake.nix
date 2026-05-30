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

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    graphite.url = "github:GraphiteEditor/Graphite";

    pelican.url = "github:Hythera/nix-pelican";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    catppuccin,
    home-manager,
    niri,
    affinity-nix,
    pelican,
    graphite,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    stable-pkgs = nixpkgs-stable.legacyPackages.${system};
  in {
    nixosConfigurations.homenix = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        inherit stable-pkgs;
      };
      modules = [
        ./cache.nix
        ./configuration.nix
        ./hosts/homenix
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager

        pelican.nixosModules.default # enable the NixOS moduel
        {nixpkgs.overlays = [pelican.overlays.default];}

        ({pkgs, ...}: {
          nixpkgs.overlays = [
            affinity-nix.overlays.default
            (final: _prev: {
              stable = import inputs.nixpkgs-stable {
                system = final.system;
                config = {
                  allowUnfree = true;
                  permittedInsecurePackages = [];
                };
              };
              unstable = import inputs.nixpkgs {
                system = final.system;
                config = {
                  allowUnfree = true;
                  permittedInsecurePackages = [];
                };
              };
            })
          ];
        })
      ];
    };
  };
}

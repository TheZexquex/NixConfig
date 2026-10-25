{
  description = "TheZexquex' super cool NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:Nixos/nixpkgs/nixos-25.05";

    vicinae.url = "github:vicinaehq/vicinae";

    affinity-nix.url = "github:mrshmllow/affinity-nix";

    openxlr.url = "github:emaspa/openxlr";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    graphite.url = "github:GraphiteEditor/Graphite";

    agenix.url = "github:ryantm/agenix";

    pelican.url = "github:Hythera/nix-pelican";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    affinity-nix,
    pelican,
    vicinae,
    agenix,
    disko,
    openxlr,
    librewave,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    stable-pkgs = nixpkgs-stable.legacyPackages.${system};
  in {
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

    nixosConfigurations = {
      homenix = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit stable-pkgs;
        };
        modules = [
          {nixpkgs.hostPlatform = system;}
          ./cache.nix
          ./config.nix
          ./hosts/homenix
          ./programs
          ./modules

          openxlr.nixosModules.default
          {services.openxlr.enable = true;}

          vicinae.nixosModules.default
          home-manager.nixosModules.home-manager
          agenix.nixosModules.default

          pelican.nixosModules.default
          {
            nixpkgs.overlays = [
              pelican.overlays.default
              affinity-nix.overlays.default
            ];
          }
        ];
      };

      travelnix = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit stable-pkgs;
        };
        modules = [
          {nixpkgs.hostPlatform = system;}
          ./cache.nix
          ./config.nix
          ./hosts/travelnix
          ./programs
          ./modules

          vicinae.nixosModules.default
          home-manager.nixosModules.home-manager
          agenix.nixosModules.default
        ];
      };

      hetznix = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit stable-pkgs;
        };
        modules = [
          {nixpkgs.hostPlatform = system;}
          ./hosts/hetznix
          disko.nixosModules.disko
          agenix.nixosModules.default
        ];
      };
    };
  };
}

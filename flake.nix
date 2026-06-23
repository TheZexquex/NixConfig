{
  description = "TheZexquex' super cool NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:Nixos/nixpkgs/nixos-25.05";

    catppuccin.url = "github:catppuccin/nix";

    vicinae.url = "github:vicinaehq/vicinae";

    affinity-nix.url = "github:mrshmllow/affinity-nix";

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

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    graphite.url = "github:GraphiteEditor/Graphite";

    pelican.url = "github:Hythera/nix-pelican";
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    catppuccin,
    home-manager,
    affinity-nix,
    pelican,
    vicinae,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    stable-pkgs = nixpkgs-stable.legacyPackages.${system};

    jbrFixOverlay = selfOverlay: superOverlay: {
      jetbrains-jdk-patched = superOverlay.stdenv.mkDerivation rec {
        pname = "jetbrains-jdk-bin";
        version = "25.0.3-linux-x64-b329.124";

        src = superOverlay.fetchurl {
          url = "https://cache-redirector.jetbrains.com/intellij-jbr/jbr_jcef-${version}.tar.gz";
          hash = "sha256-0qUPSN+zV39BTp/A7OgOIEhs6hewqZwXxZUXXzE053U=";
        };

        nativeBuildInputs = [
          superOverlay.autoPatchelfHook
          superOverlay.makeWrapper
        ];

        buildInputs = with superOverlay; [
          libx11
          libxext
          libxrender
          libxtst
          libglvnd
          alsa-lib
          fontconfig
          freetype
          glib
          zlib
          libXcomposite
          libXdamage
          libXfixes
          libXrandr
          libXcursor
          nss
          nspr
          dbus
          atk
          at-spi2-atk
          cups
          pango
          cairo
          libdrm
          libxkbcommon
          wayland
          mesa
        ];

        runtimeDependencies = with superOverlay; [
          udev
        ];

        dontConfigure = true;
        dontBuild = true;

        installPhase = ''
          mkdir -p $out
          cp -r * $out/
        '';
      };

      jetbrains =
        superOverlay.jetbrains
        // {
          idea = superOverlay.symlinkJoin {
            name = "idea-ultimate-jbr25-patched";
            paths = [superOverlay.jetbrains.idea];
            buildInputs = [superOverlay.makeWrapper];
            postBuild = ''
              wrap_idea() {
                local exe="$1"
                if [ -e "$exe" ]; then
                  wrapProgram "$exe" \
                    --set IDEA_JDK "${selfOverlay.jetbrains-jdk-patched}" \
                    --set FONTCONFIG_FILE "/etc/fonts/fonts.conf" \
                    --set FONTCONFIG_PATH "/etc/fonts" \
                    --prefix LD_LIBRARY_PATH : "${superOverlay.lib.makeLibraryPath [superOverlay.fontconfig superOverlay.freetype]}"
                fi
              }

              wrap_idea "$out/bin/idea"
            '';
          };
        };
    };
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
        ./programs
        ./modules
        vicinae.nixosModules.default
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager

        pelican.nixosModules.default # enable the NixOS moduel
        {
          nixpkgs.overlays = [
            pelican.overlays.default
            affinity-nix.overlays.default
            jbrFixOverlay
          ];
        }
      ];
    };
  };
}

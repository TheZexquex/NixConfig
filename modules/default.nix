{ ... }: {
  imports = [
    ./flatpak.nix
    ./gc.nix
		./upower.nix
    ./sound.nix
    ./locale.nix
    ./docker.nix
  ];
}

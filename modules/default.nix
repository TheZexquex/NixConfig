{ ... }: {
  imports = [
    ./flatpak.nix
    ./gc.nix
    ./sound.nix
    ./locale.nix
    ./docker.nix
  ];
}

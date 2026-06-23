{ ... }: {
  imports = [
    ../common
    ./modules
    ./hardware.nix
    ./wayland.nix
    ./systempackages.nix
    ./mc-experiments
  ];
}

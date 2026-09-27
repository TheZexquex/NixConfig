{...}: {
  imports = [
    ../common
    ./configuration
    ./modules
    ./hardware.nix
    ./systempackages.nix
    ./desktop.nix
  ];
}

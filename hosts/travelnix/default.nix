{...}: {
  imports = [
    ../common
    ./configuration.nix
    ./modules
    ./hardware.nix
    ./systempackages.nix
    ./desktop.nix
  ];
}

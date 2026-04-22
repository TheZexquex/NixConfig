{...}: {
  imports = [
    ./firewall.nix
    ./wifi.nix
    ./bluetooth.nix
    ./boot.nix
    ./sunshine.nix
    ./gc.nix
    #    ./wireguard.nix
  ];
}

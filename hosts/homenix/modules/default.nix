{...}: {
  imports = [
    ./firewall.nix
    ./wifi.nix
    ./bluetooth.nix
    ./boot.nix
    ./sunshine.nix
    ./gc.nix
    ./keyring.nix
    #    ./wireguard.nix
  ];
}

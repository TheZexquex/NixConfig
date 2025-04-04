{ ... }: {
  imports = [
    ./firewall.nix
    ./wifi.nix
    ./bluetooth.nix
    ./boot.nix
  ];
}

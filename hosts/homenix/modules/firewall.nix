{ ... }: {
  networking.firewall.allowedTCPPorts = [ 56969 ];
  networking.firewall.allowedUDPPorts = [ 56969 ];
}

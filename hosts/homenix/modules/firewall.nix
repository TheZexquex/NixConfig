{ ... }: {
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 56969 5900 3131 1701 47984 47989 47990 48010 ];
  networking.firewall.allowedUDPPorts = [ 56969 5900 3131 1701 ];
  networking.firewall.allowedUDPPortRanges = [
    { from = 47998; to = 48000; }
    { from = 8000; to = 8010; }
  ];
}

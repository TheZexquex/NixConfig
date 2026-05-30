{...}: {
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    3000
    8080
    6443
    25565 # Mc k3s tests
  ];
  networking.firewall.allowedUDPPorts = [
    3000
    8080
  ];
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 7000;
      to = 8000;
    }
  ];
  networking.firewall.allowedUDPPortRanges = [
    {
      from = 7000;
      to = 8000;
    }
  ];
}

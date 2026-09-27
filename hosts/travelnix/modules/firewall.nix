{...}: {
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    # 3000
  ];
  networking.firewall.allowedUDPPorts = [
    # 3000
  ];
  networking.firewall.allowedTCPPortRanges = [
    # {
    #  from = 7000;
    #  to = 8000;
    # }
  ];
  networking.firewall.allowedUDPPortRanges = [
    # {
    #  from = 7000;
    #  to = 8000;
    # }
  ];
}

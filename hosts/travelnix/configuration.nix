{
  ...
}:
{
  networking.hostName = "travelnix";

  # No wireguard keys on this host yet
  networking.wg-quick.interfaces.wg0.autostart = false;

  system.stateVersion = "26.05";
}

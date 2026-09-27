{
  pkgs,
  ...
}:
{
  programs.dconf.enable = true;
  programs.nix-ld.enable = true;
  programs.ssh.startAgent = false;

  services.dbus.enable = true;

  services.udisks2.enable = true;

  fonts.packages = builtins.filter pkgs.lib.attrsets.isDerivation (
    builtins.attrValues pkgs.nerd-fonts
  ); # fonts

  environment.variables = {
    GTK_THEME = "adw-gtk3-dark";
    XDG_RUNTIME_DIR = "/run/user/$UID";
    RUSTICL_ENABLE = "radeonsi";
    ROC_ENABLE_PRE_VEGA = "1";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}

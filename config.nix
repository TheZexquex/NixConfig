{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ ];

  programs.dconf.enable = true;
  programs.nix-ld.enable = true;
  programs.ssh.startAgent = false;

  services.dbus.enable = true;
  services.udisks2.enable = true;

  fonts.packages = builtins.filter pkgs.lib.attrsets.isDerivation (
    builtins.attrValues pkgs.nerd-fonts
  );
}

{ ... }: {
  imports = [
    ./home.nix
    ./users.nix
  ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

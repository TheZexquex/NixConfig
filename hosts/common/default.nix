{ ... }: {
  imports = [
    ./home.nix
    ./users.nix
  ];
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bitwarden has not updated yet
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];
}

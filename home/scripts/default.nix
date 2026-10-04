{pkgs, ...}: {
  home.packages = [
    (import ./scf.nix {inherit pkgs;})
  ];
}

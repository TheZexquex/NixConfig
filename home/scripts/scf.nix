{pkgs}:
pkgs.writeShellApplication {
  name = "scf";

  runtimeInputs = with pkgs; [
    ripgrep
    fzf
    bat
    neovim
  ];

  text = builtins.readFile ./scf.sh;
}

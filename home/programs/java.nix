{ pkgs, ... }: {
  programs.java = {
    enable = true;
    package = pkgs.jdk21;
  };

  programs.gradle = {
    enable = true;
  };
}

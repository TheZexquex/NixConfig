{ pkgs, ... }: {
  programs.java = {
    enable = true;
    package = pkgs.javaPackages.compiler.temurin-bin.jdk-25;
  };

  programs.gradle = {
    enable = true;
  };
}

{ ... }: {
  programs.zsh = {
    enable = true;

    interactiveShellInit = ''
    eval "$(starship init zsh)"
    '';

    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nix";
      addpkgs = "~/Scripts/addpkgs.sh";
    };
  };
}

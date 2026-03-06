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
      rebuild = "sudo nixos-rebuild switch --flake ~/nix  && reloadpanel";
      reloadpanel = "pkill quickshell && hyprctl dispatch exec noctalia-shell";
      addpkgs = "~/Scripts/addpkgs.sh";
    };
  };
}

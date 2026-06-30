{...}: {
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
      rebuild = "sudo nixos-rebuild switch --flake ~/nix && reloadpanel";
      rbs = "nixos-rebuild switch --flake ~/infra/hetzner#hetznix --target-host thezexquex@10.66.66.1 --build-host  thezexquex@10.66.66.1 --sudo --ask-sudo-password";
      rebuildt = "sudo nixos-rebuild switch --flake ~/nix --show-trace && reloadpanel";
      reloadpanel = "pkill quickshell && hyprctl dispatch exec env QML2_IMPORT_PATH=\"$HOME/.nix-profile/lib/qt-6/qml\" noctalia-shell";
      ncf = "find ~/nix -type f -name \"*.nix\" | fzf --preview 'bat --color=always {}' | xargs nvim";
    };
  };
}

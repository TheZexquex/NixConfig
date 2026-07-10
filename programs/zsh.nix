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
      rebuild = "sudo nixos-rebuild switch --flake ~/nix";
      rebuildt = "sudo nixos-rebuild switch --flake ~/nix --show-trace";
      rbs = "nixos-rebuild switch --flake ~/infra/hetzner#hetznix --target-host thezexquex@10.66.66.1 --build-host  thezexquex@10.66.66.1 --sudo --ask-sudo-password";
      ncf = "find ~/nix -type f -name \"*.nix\" | fzf --preview 'bat --color=always {}' | xargs nvim";
    };
  };
}

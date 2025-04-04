{ ... }: {
  home.file.".ssh/allowed_signers".text =
    "* ${builtins.readFile ~/.ssh/id_ed25519.pub}";
  programs.git = {
    enable = true;
    userName = "TheZexquex";
    userEmail = "jakobreiser@gmx.de";
    extraConfig = {
      init.defaultBranch = "main";
        # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      user.signingkey = "~/.ssh/id_ed25519_github.pub";
    };
  };
}

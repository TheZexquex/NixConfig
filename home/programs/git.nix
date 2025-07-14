{ config, lib, pkgs, ... }: {


  programs.git = {
    enable = true;
    userName = "TheZexquex";
    userEmail = "jakobreiser@gmx.de";

    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIKnUPf31V72xBN4Qv51t8UjXqWd3we7h7XybvFkVVw3 jakobreiser@gmx.de";
      signByDefault = true;
    };

    extraConfig = {
      init.defaultBranch = "main";
        # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}

{osConfig, ...}: let
  sshKeys = {
    homenix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIKnUPf31V72xBN4Qv51t8UjXqWd3we7h7XybvFkVVw3 thezexquex@homenix";
    travelnix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAaJhW14lOOlbKNE46UnMRyRpvcZV8S5FklHDh3UcyuK thezexquex@travelnix";
  };
in {
  programs.git = {
    enable = true;

    signing = {
      key = sshKeys.${osConfig.networking.hostName};
      signByDefault = true;
      format = "ssh";
      allowedSigners = ''
        contact@thezexquex.dev namespaces="git" ${sshKeys.homenix}
        contact@thezexquex.dev namespaces="git" ${sshKeys.travelnix}
      '';
    };

    lfs = {
      enable = true;
    };

    settings = {
      user.email = "contact@thezexquex.dev";
      user.name = "TheZexquex";

      init.defaultBranch = "main";

      core.autocrlf = "input";
      pull.rebase = true;
    };
  };
}

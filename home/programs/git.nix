{...}: {
  programs.git = {
    enable = true;

    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIKnUPf31V72xBN4Qv51t8UjXqWd3we7h7XybvFkVVw3 thezexquex@homenix";
      signByDefault = true;
      format = "ssh";
      allowedSigners = ''
        contact@thezexquex.dev namespaces="git" ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIKnUPf31V72xBN4Qv51t8UjXqWd3we7h7XybvFkVVw3 thezexquex@homenix
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

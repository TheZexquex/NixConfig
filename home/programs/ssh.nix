{...}: {
  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
      };

      "github.com" = {
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };

      "hetznix" = {
        hostname = "10.66.66.1";
        port = 22;
        user = "thezexquex";
      };
    };
  };
}

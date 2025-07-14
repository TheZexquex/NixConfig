{ ... }: {
  programs.ssh = {
    enable = true;
    startAgent = false;
  };
}

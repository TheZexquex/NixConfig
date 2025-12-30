{ ... }: {
  programs.flameshot = {
    enable = true;
    settings = {
      useGrimAdapter = true;
    };
  };
}

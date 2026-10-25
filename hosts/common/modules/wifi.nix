{...}: {
  networking = {
    networkmanager.enable = true;
    wireless.enable = true;

    hosts = {
      "127.0.0.1" = ["outline.localhost"];
    };
  };
}

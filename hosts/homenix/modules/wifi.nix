{...}: {
  networking = {
    networkmanager.enable = true;
    wireless.enable = true;
    hostName = "homenix";

    hosts = {
      "127.0.0.1" = ["panel.handwerksangriff.de" "node1.handwerksangriff.de"];
    };
  };
}

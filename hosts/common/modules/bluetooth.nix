{config, ...}: {
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Name = "${config.networking.hostName}";
        ControllerMode = "dual";
        FastConnect = "true";
        Experimental = "true";
      };
      Policy.AutoEnable = true;
    };
  };
}

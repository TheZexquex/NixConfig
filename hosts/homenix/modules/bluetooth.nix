{ ... }: {
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Name = "homenix";
        ControllerMode = "dual";
        FastConnect = "true";
        Experimental = "true";
      };
      Policy.AutoEnable = true;
    };
  };
}

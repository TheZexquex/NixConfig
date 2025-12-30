{ inputs, ... }: {
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia-shell = {
      enable = true;
      settings = {
        # configure noctalia here; defaults will
        # be deep merged with these attributes.
        bar = {
          density = "compact";
          position = "top";
          showCapsule = false;
          widgets = {
            left = [
              {
                id = "SidePanelToggle";
                useDistroLogo = true;
              }
              
            ];
            center = [
              {
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "none";
              }
            ];
            right = [
              {
                id = "WiFi";
              }
              {
                id = "Bluetooth";
              }
              {
                formatHorizontal = "HH:mm:ss";
                formatVertical = "HH mm ss";
                id = "Clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
          };
        };
        colorSchemes.predefinedScheme = "Catppuccin";
        general = {
          avatarImage = "/home/drfoobar/.face";
          radiusRatio = 0.4;
          scaleRatio = 2.0;
        };
        location = {
          monthBeforeDay = false;
          name = "Munich, Germany";
        };
      };
      # this may also be a string or a path to a JSON file,
      # but in this case must include *all* settings.
  };
}

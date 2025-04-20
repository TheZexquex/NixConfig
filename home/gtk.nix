{ pkgs, ... }: {
   gtk = {
    enable = true;
    theme = {
      name = "atppuccin-Dark-Macchiato";
      package = pkgs.magnetic-catppuccin-gtk;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  };
}

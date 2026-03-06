{ pkgs, ... }: {
   gtk = {
    enable = true;

    cursorTheme = {
      name = "Future";
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  };
}

{
  pkgs,
  config,
  ...
}: {
  gtk = {
    enable = true;

    cursorTheme = {
      name = "Future";
    };

    colorScheme = "dark";

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.theme = config.gtk.theme;
  };
}

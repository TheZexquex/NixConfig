{
  pkgs,
  config,
  ...
}: {
  gtk = {
    enable = true;

    gtk2.force = true;

    cursorTheme = {
      name = "Future";
    };

    colorScheme = "dark";

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    gtk4.theme = config.gtk.theme;
  };

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };
}

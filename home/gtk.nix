{ pkgs, ... }: {
   gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-blue-compact+normal";
      package = pkgs.catppuccin-gtk;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  };
}

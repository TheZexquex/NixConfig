{...}: {
  programs.appimage = {
    enable = true;
    binfmt = true; # Allows running AppImages directly like ./app.AppImage
  };
}

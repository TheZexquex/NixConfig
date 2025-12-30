{ ... }: {
  home.file."/.local/share/applications/modrinth-app-x11.desktop".text = ''
    [Desktop Entry]
    Name=Modrinth App (X11)
    Comment=Launch Modrinth App under X11 to avoid Wayland scaling issues
    Exec=ModrinthApp
    Icon=modrinth-app
    Type=Application
    Categories=Game;Utility;
    StartupNotify=true
  '';
}

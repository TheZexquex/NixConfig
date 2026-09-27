{
  pkgs,
  inputs,
  stable-pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gnumake
    certbot

    blender
    easyeffects
    clang-tools
    postman

    davinci-resolve-studio
    kdePackages.kdenlive
    wayvnc
    tigervnc
    deskreen

    # Pelican Panel
    php
    nginx
    mariadb

    # GPU
    rocmPackages.clr.icd
    clinfo

    # Remote
    weylus
    parsec-bin
    scrcpy

    # Audio
    qpwgraph
    pulsemeeter
    pwvucontrol
    wf-recorder
    tenacity
    # ocenaudio

    # System tools and customization
    resources
    bottom
    btop

    mangohud
    mangojuice
    goverlay
    walker
    kdePackages.okular

    godot_4_7-mono

    # This and that
    # wineWow64Packages.stable
    # winboat
    # stable-pkgs.bottles
    lutris
    ntfs3g

    ungoogled-chromium
    brave

    # Minecraft
    gdlauncher-carbon
    ftb-app
    # Fix for ui scaling and layout problem under wayland
    #(pkgs.writeShellScriptBin "ModrinthApp" ''
    #  #!${pkgs.bash}/bin/bash
    #  export GDK_BACKEND=x11
    #  exec ${pkgs.modrinth-app}/bin/ModrinthApp "$@"
    #'')
    jmc2obj

    lunar-client
    blockbench
    usbutils

    # Devtools and Languages
    pnpm
    python3
    dotnetCorePackages.sdk_10_0-bin

    # Passwords
    bitwarden-desktop
    libsecret

    # Themes
    glib
    nwg-look
    pywalfox-native
    matugen
    adw-gtk3
    gnome-themes-extra
    kdePackages.kirigami
    kdePackages.breeze
    sassc
    catppuccin
    # catppuccin-kde
    # magnetic-catppuccin-gtk
    waypaper
    wpgtk
    pywal
    kdePackages.qt6ct

    # Graphic Programs
    gimp3
    inkscape
    krita
    aseprite

    # Asd
    wl-clipboard
    gnomeExtensions.clipboard-indicator
    clipse
    dart-sass
    upower
    gvfs
    bluez
    gzip
    zip
    unzip
    rar
    # unrar
    openssl
    file
    networkmanager
    fzf
  ];
}

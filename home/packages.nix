{
  pkgs,
  inputs,
  stable-pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gnumake
    yq
    wayfreeze
    certbot

    blender
    easyeffects
    clang-tools
    postman

    # Terminal
    alacritty
    fastfetch

    # Filemanager
    nnn
    yazi
    superfile
    nautilus
    krusader
    filezilla

    traceroute
    mtr

    gotop

    # Office
    thunderbird
    onlyoffice-desktopeditors
    libreoffice
    trelby

    # Fileshare
    rquickshare
    localsend
    celeste
    nextcloud-client

    # Java
    maven
    (gradle.overrideAttrs {
      javaToolchains = with pkgs; [jdk11 jdk17 jdk21 javaPackages.compiler.temurin-bin.jdk-25];
    })
    javaPackages.openjfx25
    recaf-launcher

    # Screenshots + Recording + Editing
    satty
    grim
    hyprshot
    flameshot
    kooha
    slurp

    # kdePackages.kdenlive
    davinci-resolve-studio
    gnome-network-displays
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
    wf-recorder
    tenacity
    # ocenaudio

    # System tools and customization
    resources
    bottom
    btop
    net-tools
    bat

    ashell
    inputs.noctalia.packages.${system}.default
    mangohud
    mangojuice
    goverlay
    brightnessctl
    wf-recorder
    walker
    vlc
    rapidraw
    rawtherapee
    darktable
    geeqie # Image viewer
    kdePackages.okular
    oculante
    gnome-disk-utility
    popsicle
    udiskie # Aoutomounting for removable disks
    baobab # Disk Usage
    yt-dlp
    video-downloader
    media-downloader
    ffmpeg

    # Editors and IDEs
    jetbrains.idea
    jetbrains.rider
    jetbrains.webstorm
    jetbrains.clion
    jetbrains.goland
    jetbrains.datagrip
    jetbrains.pycharm
    # android-studio
    godot_4_7-mono
    unityhub
    vscode
    zed-editor

    # Formatters / LSPs
    alejandra
    nixd
    nil
    lua-language-server
    stylua

    rust-analyzer

    # vimPlugins.markview-nvim
    # vimPlugins.astrocore
    # vimPlugins.astrotheme
    # vimPlugins.astroui
    # vimPlugins.astrolsp

    rnote
    obsidian

    # This and that
    wine
    winboat
    # stable-pkgs.bottles
    # stable-pkgs.lutris
    ntfs3g

    ungoogled-chromium
    brave

    # Streaming
    chatterino7

    # Chat
    halloy
    discord
    signal-desktop
    # teamspeak6-client

    # Gaming and fun
    pear-desktop # YT Music
    spotify
    hollywood
    mousai

    # Minecraft
    gdlauncher-carbon
    modrinth-app
    ftb-app
    prismlauncher
    # Fix for ui scaling and layout problem under wayland
    #(pkgs.writeShellScriptBin "ModrinthApp" ''
    #  #!${pkgs.bash}/bin/bash
    #  export GDK_BACKEND=x11
    #  exec ${pkgs.modrinth-app}/bin/ModrinthApp "$@"
    #'')
    jmc2obj

    lunar-client
    labymod-launcher
    blockbench
    usbutils

    # Devtools and Languages
    go
    git
    bun
    cargo
    python3
    # python312Packages.pip
    dotnetCorePackages.sdk_10_0-bin
    # dotnet-runtime_10
    gcc
    docker
    appimage-run

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
    gtk-engine-murrine
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

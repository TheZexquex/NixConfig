{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    gnumake
    python313
    pipenv
    yq
    hollywood
    # linuxPackages.virtualbox
    bottom
    wayfreeze
    qmk
    via
    myxer
    halloy
    eww
    certbot
    mousai
    waybar
    jmc2obj
    blender
    easyeffects
    clang-tools
    postman
    filezilla

    # Terminal
    alacritty
    neofetch
    fastfetch

    # Filemanager
    nnn
    yazi
    superfile
    nautilus
    krusader

    traceroute
    mtr

    gotop

    # Office
    thunderbird
    onlyoffice-desktopeditors

    # Google Quickshare
    rquickshare
    localsend
    celeste
    nextcloud-client
    maven
    (gradle.overrideAttrs {
      javaToolchains = with pkgs; [jdk11 jdk17 jdk21 javaPackages.compiler.temurin-bin.jdk-25];
    })
    recaf-launcher

    # Screenshots + Recording + Editing
    satty
    grim
    flameshot
    kooha
    slurp
    # kdePackages.kdenlive
    # davinci-resolve-studio
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
    anydesk
    weylus
    parsec-bin
    scrcpy

    # Audio
    helvum
    qpwgraph
    pulsemeeter
    wf-recorder
    tenacity
    ocenaudio

    # System tools and customization
    hyprpaper
    hyprpicker
    hyprlock
    hyprsunset
    ashell
    inputs.noctalia.packages.${system}.default
    inputs.vicinae.packages.${pkgs.system}.default
    btop
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
    udiskie # Aoutomounting for removable disks
    yt-dlp
    video-downloader
    media-downloader
    ffmpeg

    # Editors and IDEs
    jetbrains.idea
    jetbrains.webstorm
    jetbrains.clion
    jetbrains.goland
    jetbrains.datagrip
    jetbrains.pycharm
    android-studio
    godot
    unityhub
    vscode
    lunarvim
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
    bottles

    ungoogled-chromium
    brave

    # Streaming
    chatterino7

    # Gaming and fun
    youtube-music
    spotify
    discord
    # teamspeak6-client
    zapzap # WhatsApp
    signal-desktop

    gdlauncher-carbon
    modrinth-app
    # Fix for ui scaling and layout problem under wayland
    #(pkgs.writeShellScriptBin "ModrinthApp" ''
    #  #!${pkgs.bash}/bin/bash
    #  export GDK_BACKEND=x11
    #  exec ${pkgs.modrinth-app}/bin/ModrinthApp "$@"
    #'')

    lunar-client
    labymod-launcher
    # mcpelauncher-ui-qt
    blockbench
    lutris

    # Devtools and Languages
    go
    git
    bun
    # python3
    # python312Packages.pip
    nodejs_20
    gcc
    docker
    appimage-run

    # Passwords
    gnome-keyring
    kdePackages.kwalletmanager
    # pinentry-gnome3
    seahorse
    bitwarden-desktop
    libsecret
    # kdePackages.kwalletmanager

    # Themes
    glib
    nwg-look
    pywalfox-native
    matugen
    adw-gtk3
    gnome-themes-extra
    gtk-engine-murrine
    sassc
    catppuccin
    catppuccin-kde
    magnetic-catppuccin-gtk
    waypaper
    wpgtk
    pywal
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qt6ct

    # Graphic Programs
    gimp3
    inputs.affinity-nix.packages.x86_64-linux.v3
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
    jq
    fzf
  ];
}

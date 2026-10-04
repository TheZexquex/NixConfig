{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    yq
    wayfreeze

    # Terminal
    alacritty
    fastfetch

    # Filemanager
    superfile
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.breeze-gtk
    krename
    filezilla

    traceroute
    mtr

    # Office
    thunderbird
    onlyoffice-desktopeditors
    rnote
    obsidian

    # Fileshare
    rquickshare
    localsend
    nextcloud-client
    kopia
    kopia-ui

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
    flameshot
    slurp
    hyprshot

    # kdePackages.kdenlive
    gnome-network-displays

    # GPU
    wf-recorder
    tenacity
    # ocenaudio
    pulseaudio
    alsa-utils

    # System tools and customization
    inputs.noctalia.packages.${system}.default # Desktop
    # inputs.vicinae.packages.${pkgs.system}.default # Launcher

    resources # Taskmanager
    bottom # Taskmanager
    btop # Taskmanager
    appimage-run # Run appimages on nixos
    tree
    rcon-cli

    brightnessctl
    wl-clipboard

    # clipse Cool terminal clipboard (works only sometimes)
    bat
    ripgrep # grep but faster
    gzip
    zip
    unzip
    rar
    # unrar
    openssl
    file
    jq
    fzf

    vlc
    geeqie # Image viewer
    oculante
    gnome-disk-utility
    popsicle
    udiskie # Automounting for removable disks
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
    jetbrains.phpstorm
    godot
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

    # This and that
    wine
    # winboat (insecure gerade)
    # stable-pkgs.bottles
    # stable-pkgs.lutris
    ntfs3g
    android-tools

    # ungoogled-chromium

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
    modrinth-app
    labymod-launcher

    # Devtools and Languages
    go
    git
    bun
    cargo
    python3
    nodejs
    gcc
    rustc
    webkitgtk_6_0
    librsvg

    # Passwords
    bitwarden-desktop

    # Themes
    pywalfox-native
    matugen
    adw-gtk3
    catppuccin
    pywal

    # Graphic Programs
    gimp3
    krita
    affinity-v3
    # aseprite
  ];
}

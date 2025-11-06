{ pkgs, inputs, ... }: {
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

    gotop

    # Office
    thunderbird
    onlyoffice-desktopeditors

    # Google Quickshare
    rquickshare
    localsend
    celeste
    maven
    (gradle.overrideAttrs {
        javaToolchains = with pkgs; [ jdk11 jdk17 jdk21 ];
    })
    recaf-launcher

    # Screenshots + Recording + Editing 
    satty
    grim
    flameshot
    kooha
    slurp
    kdePackages.kdenlive
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
    stable.jetbrains.idea-ultimate
    jetbrains.webstorm
    jetbrains.clion
    jetbrains.goland
    jetbrains.datagrip
    jetbrains.pycharm-community
    jetbrains.pycharm-professional
    vscode
    lunarvim
    zed-editor
    vimPlugins.markview-nvim
    rnote
    obsidian
     
    # This and that
    wine
    winboat
    bottles

    ungoogled-chromium

    # Streaming
    davinci-resolve-studio
    chatterino7
    
    # Gaming and fun
    youtube-music
    spotify
    discord
    wasistlos # WhatsApp 
    signal-desktop
    modrinth-app
    lunar-client
    labymod-launcher
    luanti
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

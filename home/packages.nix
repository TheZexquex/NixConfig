{ pkgs, ... }: {
  home.packages = with pkgs; [
    halloy
    eww-wayland
    eww
    sonusmix
    clipgrab
    onlyoffice-desktopeditors
    collabora-online
    certbot
    mousai
    davinci-resolve-studio
    waybar
    jmc2obj
    blender
    pulsemeeter
    easyeffects
    yazi
    ueberzugpp
    clang-tools

    lutris
    helvum
    # Terminal
    alacritty
    neofetch
    fastfetch
    nnn
    traceroute

    gotop

    # Google Quickshare
    rquickshare
    nautilus
    nemo-with-extensions
    superfile
    kdePackages.dolphin

    # Screenshots
    satty
    grim
    slurp

    # Audio
    qpwgraph

    # System tools and customization
    hyprpaper
    hyprpicker
    hyprlock
    hyprsunset
    btop
    mangohud
    mangojuice
    goverlay
    brightnessctl
    wf-recorder
    walker
    obs-studio
    vlc
    geeqie # Image viewer
    udiskie # Aoutomounting for removable disks

    # Editors and IDEs
    jetbrains.idea-ultimate
    jetbrains.webstorm
    jetbrains.clion
    jetbrains.datagrip
    vscode
    lunarvim
    vimPlugins.markview-nvim
    rnote
    obsidian
     
    # This and that
    wine
    bottles

    ungoogled-chromium 
    
    # Gaming and fun
    youtube-music
    spotify
    discord
    whatsapp-for-linux
    modrinth-app
    lunar-client
    labymod-launcher
    minetest
    streamcontroller
    
    # Devtools and Languages
    go
    git
    bun
    python3
    python312Packages.pip
    nodejs_20
    gcc
    jdk23
    docker
    appimage-run

    # Passwords
    gnome-keyring
    libsForQt5.kwalletmanager
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

    #
    gimp3
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
    file
    networkmanager
    jq
    fzf
  ];   
}

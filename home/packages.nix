{ pkgs, ... }: {
  home.packages = with pkgs; [
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
    
    # Gaming and fun
    youtube-music
    spotify
    discord
    whatsapp-for-linux
    modrinth-app
    lunar-client
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

    bitwarden-desktop
    kdePackages.kwalletmanager
    
    # Themes
    gnome-themes-extra
    gtk-engine-murrine
    sassc
    catppuccin
    catppuccin-kde
    magnetic-catppuccin-gtk

    # Asd
    wl-clipboard
    dart-sass
    upower
    gvfs
    bluez
    networkmanager
  ];   
}

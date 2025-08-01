# Edit this configuration file to define what should be installed on your system.  Help is available 
# in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./programs
    ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  programs.dconf.enable = true;
  programs.ssh.startAgent = false;

  # Set your time zone.

  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      # set the flake package
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # make sure to also set the portal package, so that they are in sync
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  
  virtualisation.docker.enable = true;
  virtualisation.waydroid.enable = true;

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = false;
  services.desktopManager.plasma6.enable = false;

  services.dbus.enable = true;
 

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      mesa
      libva
      libvdpau-va-gl
      vulkan-loader
      vulkan-validation-layers
      amdvlk # Optional: AMD's proprietary Vulkan driver
      mesa.opencl
    ];
  };

  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Name = "homenix";
        ControllerMode = "dual";
        FastConnect = "true";
        Experimental = "true";
      };
      Policy.AutoEnable = true;
    };
  };
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.xserver.displayManager.sessionPackages = [ pkgs.hyprland ];

  # PAM-Konfiguration bleibt gleich
  security.pam.services = {
    gdm = {
     enableGnomeKeyring = true;
    };
    gdm-password = {
      enableGnomeKeyring = true;
    };
    
    login = {
      enableGnomeKeyring = true; 
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  
  fonts.packages = builtins.filter pkgs.lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts); # fonts


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.


  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nix.settings.experimental-features = ["nix-command" "flakes"];
  environment.systemPackages = with pkgs; [
    libsecret
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    inputs.swww.packages.${pkgs.system}.swww
  ];

  environment.variables.XDG_RUNTIME_DIR = "/run/user/$UID";
  programs.seahorse.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}

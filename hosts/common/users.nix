{ catppuccin, ...}: {
  users.users.thezexquex = {
      isNormalUser = true;
      description = "Jakob Reiser";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
}
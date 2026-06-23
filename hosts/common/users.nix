{pkgs, ...}: {
  users.users.thezexquex = {
    isNormalUser = true;
    description = "TheZexquex";
    extraGroups = ["networkmanager" "wheel" "docker" "input"];
    shell = pkgs.zsh;
  };
}

{pkgs, ...}: {
  users.users.thezexquex = {
    isNormalUser = true;
    description = "TheZexquex";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
  };
}

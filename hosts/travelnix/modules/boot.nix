{...}: {
  boot.initrd.kernelModules = ["amdgpu"];

  boot.loader = {
    grub.enable = false;
    systemd-boot = {
      enable = true;
    };
    efi.canTouchEfiVariables = true;
  };
}

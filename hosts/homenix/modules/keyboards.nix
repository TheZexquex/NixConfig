{pkgs, ...}: {
  # WebHID access for the keyboard configurators (Keychron Launcher, MCHOSE Hub) in Chromium.
  # Shipped as a package so the rule lands before 73-seat-late.rules, which applies uaccess.
  services.udev.packages = [
    (pkgs.writeTextFile {
      name = "keyboard-webhid-udev-rules";
      destination = "/lib/udev/rules.d/70-keyboard-webhid.rules";
      text = ''
                # Keychron K2 HE
                KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0e21", TAG+="uaccess"
                # Keychron Link (wireless dongle)
                KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="d030", TAG+="uaccess"
                # MCHOSE L7 Ultra+
                KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3837", ATTRS{idProduct}=="4016", TAG+="uaccess"
        				# MCHOSE L7 Ultra+
                KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="5253", ATTRS{idProduct}=="1020", TAG+="uaccess"
      '';
    })
  ];
}

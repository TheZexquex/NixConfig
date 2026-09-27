{...}: {
  services.pipewire.wireplumber.extraConfig."51-disable-unused-audio" = {
    "monitor.alsa.rules" = [
      {
        matches = [
          {"device.name" = "alsa_card.usb-Generic_USB_Audio-00";}
        ];
        actions = {
          "update-props" = {
            "device.disabled" = true;
          };
        };
      }
      {
        matches = [
          {"device.name" = "alsa_card.pci-0000_03_00.1";}
        ];
        actions = {
          "update-props" = {
            "device.disabled" = true;
          };
        };
      }
      {
        matches = [
          {"device.name" = "alsa_card.pci-0000_00_1f.3";}
        ];
        actions = {
          "update-props" = {
            "device.disabled" = true;
          };
        };
      }
    ];
  };

  services.pipewire.extraConfig.pipewire."99-custom-channels" = {
    "context.modules" = [
      {
        name = "libpipewire-module-loopback";
        args = {
          "node.name" = "Musik_Sink";
          "node.description" = "Music Mix";
          "capture.props" = {
            "media.class" = "Audio/Sink";
            "audio.position" = ["FL" "FR"];
          };
          "playback.props" = {
            "media.class" = "Audio/Source";
            "audio.position" = ["FL" "FR"];
            "node.passive" = true;
          };
        };
      }

      {
        name = "libpipewire-module-loopback";
        args = {
          "node.name" = "Discord_Sink";
          "node.description" = "Discord";
          "capture.props" = {
            "media.class" = "Audio/Sink";
            "audio.position" = ["FL" "FR"];
          };
          "playback.props" = {
            "media.class" = "Audio/Source";
            "audio.position" = ["FL" "FR"];
            "node.passive" = true;
          };
        };
      }
    ];
  };
}

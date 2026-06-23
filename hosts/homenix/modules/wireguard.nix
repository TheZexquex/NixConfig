{
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [
        "10.66.66.2/32"
      ];

      dns = [
        "1.1.1.1"
      ];

      privateKeyFile = "/home/thezexquex/wireguard/client_private.key";

      peers = [
        {
          publicKey = "8JYgM07FN25faG2SILgopmvG4XupsQMpSjngYTRQOWY=";
          allowedIPs = [
            "10.66.66.1/32"
          ];
          endpoint = "5.75.166.22:51820";
          presharedKeyFile = "/home/thezexquex/wireguard/preshared.key";
        }
      ];
      autostart = true;
    };
  };
}

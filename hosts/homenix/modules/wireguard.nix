{
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [
        "10.66.66.4/32"
        "fd42:42:42::4/128"
      ];

      dns = [
        "1.1.1.1"
        "1.0.0.1"
      ];

      privateKeyFile = "/home/thezexquex/wireguard/wg0pv.key";

      peers = [
        {
          publicKey = "GiEMGlOUkPqI66Ranc3CmSISMaJ2BPja0BYJPr9HwSY=";
          allowedIPs = [
            "10.66.66.0/24"
          ];
          endpoint = "144.76.74.251:55646";
          presharedKeyFile = "/home/thezexquex/wireguard/wg0ps.key";
        }
      ];
      autostart = true;
    };
  };
}

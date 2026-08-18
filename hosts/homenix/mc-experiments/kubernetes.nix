{...}: {
  services.k3s = {
    enable = false;
    role = "server";
    extraFlags = "--disable traefik";
  };
}

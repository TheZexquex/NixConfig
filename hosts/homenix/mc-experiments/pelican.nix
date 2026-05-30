{pkgs, ...}: {
  # PANEL
  services.pelican.panel = {
    enable = false;
    app = {
      url = "http://panel.handwerksangriff.de";
      # echo "base64:$(openssl rand -base64 32)"
      keyFile = "/etc/pelican/secrets/app.key";
    };
    # you can use *.password = "password_here";
    database.passwordFile = "/etc/pelican/secrets/password_db";
    redis.passwordFile = "/etc/pelican/secrets/password_redis";
    mail.passwordFile = "/etc/pelican/secrets/password_mail";
  };

  # WINGS
  services.pelican.wings = {
    enable = false;
    openFirewall = false;
    uuid = "bf6632fa-e100-4e48-9b4f-0648164526c4";
    remote = "http://panel.handwerksangriff.de";
    tokenIdFile = "/etc/pelican/secrets/tokenIdFile";
    tokenFile = "/etc/pelican/secrets/tokenFile";
    api.ssl.enable = false;
    # api.ssl.certFile = "/path/to/cert";
    # api.ssl.keyFile = "/path/to/key";
  };

  virtualisation.docker.enable = true;
}

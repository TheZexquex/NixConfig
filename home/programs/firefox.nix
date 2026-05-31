{
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    configPath = ".mozilla/firefox";

    #    nativeMessagingHosts = [
    #      pkgs.pywalfox-native
    #    ];
  };
}

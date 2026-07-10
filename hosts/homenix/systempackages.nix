{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    affinity-v3

    inputs.graphite.packages.x86_64-linux.default
    inputs.agenix.packages.x86_64-linux.default

    libsecret
    git
    wget
    jq

    kubectl
    kubernetes-helm

    wireguard-tools

    lxqt.lxqt-policykit
    seahorse

    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    catppuccin-qt5ct
  ];
}

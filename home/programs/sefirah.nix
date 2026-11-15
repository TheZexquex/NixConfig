{pkgs, ...}: let
  pname = "sefirah";
  version = "3.2.0";

  src = pkgs.fetchurl {
    url = "https://github.com/shrimqy/Sefirah/releases/download/v${version}/Sefirah-${version}.AppImage";
    hash = "sha256-r4n/KYaviKvXl3cPVB4EonOdg2xjCNuSLtqN2A1N76Q=";
  };

  appimageContents = pkgs.appimageTools.extractType2 {inherit pname version src;};

  sefirah = pkgs.appimageTools.wrapType2 {
    inherit pname version src;

    extraPkgs = pkgs: with pkgs; [icu openssl lttng-ust];

    extraInstallCommands = ''
      install -Dm444 ${appimageContents}/Sefirah.desktop $out/share/applications/sefirah.desktop
      substituteInPlace $out/share/applications/sefirah.desktop \
        --replace-fail 'Exec=Sefirah' 'Exec=sefirah'
      cp -r ${appimageContents}/usr/share/icons $out/share/
    '';
  };
in {
  # Phone Link / KDE Connect alternative (needs TCP/UDP ports 5149-5169 open in the firewall)
  home.packages = [sefirah pkgs.icu];
}

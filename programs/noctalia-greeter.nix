{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  programs.noctalia-greeter = {
    enable = true;
    package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

    greeter-args = "";
    settings = {
      cursor = {
        theme = "Future";
        size = 24;
      };
      keyboard = {
        layout = "de";
      };
    };
  };
}

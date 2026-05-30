{
  inputs,
  stable-pkgs,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit stable-pkgs;
    };
    useUserPackages = true;
    # useGlobalPkgs = true;
    users = {
      thezexquex = {
        imports = [
          # inputs.hyprpanel.homeManagerModules.hyprpanel
          inputs.catppuccin.homeModules.catppuccin
          inputs.niri.homeModules.niri
          ../../home
        ];
      };
    };
  };
}

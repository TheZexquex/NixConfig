{ inputs, pkgs, home-manager, ... }: {
  home-manager =  {
    extraSpecialArgs = { inherit inputs; };
    useUserPackages = true;
    useGlobalPkgs = false;
    users = {
      thezexquex = {
        imports = [
         # inputs.hyprpanel.homeManagerModules.hyprpanel
          inputs.catppuccin.homeModules.catppuccin
          ../../home
        ];
      };
    };
  };
}

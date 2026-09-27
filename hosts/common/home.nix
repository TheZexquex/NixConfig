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

    # useUserPackages = true;
    useGlobalPkgs = true;

    users.thezexquex = {
      imports = [
        inputs.vicinae.homeManagerModules.default
        inputs.agenix.homeManagerModules.default
        ../../home
      ];
    };
  };
}

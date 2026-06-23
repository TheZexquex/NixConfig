{ ... }: {
  nix.settings = {
    substituters = [
      "https://graphite.cachix.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "graphite.cachix.org-1:B7Il1yMpkquN/dXM+5GRmz+4Xmu2aaCS1GcWNfFhsOo="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
}

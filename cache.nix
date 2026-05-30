{...}: {
  nix.settings = {
    substituters = ["https://graphite.cachix.org"];
    trusted-public-keys = [
      "graphite.cachix.org-1:B7Il1yMpkquN/dXM+5GRmz+4Xmu2aaCS1GcWNfFhsOo="
    ];
  };
}

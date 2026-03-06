{pkgs, ...}: {
  home.file.".config/nvim".source = pkgs.fetchFromGitHub {
    owner = "AstroNvim";
    repo = "template";
    rev = "89ebfd3";
    sha256 = "sha256-nxPdSG4TMpNwB8d4s3Iw/uULZgx04HBYf+QSwZXQyH8=";
  };
}

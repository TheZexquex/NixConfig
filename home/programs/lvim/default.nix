{ pkgs, ... }:

let
  plugins = import ./plugins.nix;
  lsp = import ./lsp.nix;
  formatters = import ./formatters.nix;
in {
  home.file.".config/lvim/config.lua".source = pkgs.writeText "lvim-config.lua" ''
    lvim.log.level = "warn"
    lvim.format_on_save.enabled = true
    lvim.colorscheme = "tokyonight"

    lvim.plugins = ${plugins}
    ${formatters}
    ${lsp}
  '';
}

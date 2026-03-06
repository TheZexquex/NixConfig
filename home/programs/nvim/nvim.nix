{pkgs, ...}: let
  treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: [
    plugins.bash
    plugins.comment
    plugins.css
    plugins.dockerfile
    plugins.gitattributes
    plugins.gitignore
    plugins.javascript
    plugins.json5
    plugins.json
    plugins.lua
    plugins.markdown
    plugins.nix
    plugins.python
    plugins.rust
    plugins.java
    plugins.toml
    plugins.typescript
    plugins.vue
    plugins.yaml
  ]);

  treesitterParsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = treesitter.dependencies;
  };
in {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = [
      treesitter
    ];
  };

  home.file."./.config/nvim/" = {
    source = ./config;
    recursive = true;
  };

  home.file."./.config/nvim/lua/thezexquex/init.lua".text = ''
    vim.opt.runtimepath:append("${treesitterParsers}")
  '';

  home.file."./.local/share/nvim/nix/nvim-treesitter/" = {
    recursive = true;
    source = treesitter;
  };
}

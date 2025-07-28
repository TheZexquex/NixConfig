{ ... }: {
  programs.starship = {
    enable = true;
    settings = {
      format = "╭─$username(fg:#df8e1d)$directory(fg:#DA627D)$git_branch$git_status(fg:#FCA17D)$c$elixir$elm$golang$gradle$haskell$java$julia$nodejs$nim$rust$scala(fg:#86BBD8)$docker_context(fg:#06969A)
╰─[$os](fg:#df8e1d)";
      username = {
        show_always = true;
        style_user = "#ea76cb";
        style_root = "#ea76cb";
        format = "[$user ]($style)";
        disabled = false;
      };
      os = {
        style = "#df8e1d";
        disabled = false;
      };
      directory = {
        style = "#DA627D";
        format = "[ $path ]($style)";
        truncation_length = 5;
        truncation_symbol = "…/";
        substitutions = {
          Documents = "󰈙 ";
          Downloads = " ";
          Music = " ";
          Pictures = " ";
        };
      };
      c = {
        symbol = " ";
        style = "#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      docker_context = {
        symbol = " ";
        style = "#06969A";
        format = "[ $symbol $context ]($style)";
      };
      elixir = {
        symbol = " ";
        style = "#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      elm = {
        symbol = " ";
        style = "#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      git_branch = {
        symbol = "";
        style = "#FCA17D";
        format = "[ $symbol $branch ]($style)";
      };
      git_status = {
        style = "#FCA17D";
        format = "[$all_status$ahead_behind ]($style)";
      };
      golang = {
        symbol = " ";
        style = "#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      gradle = {
        style = "#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      haskell = {
        symbol = " ";
        style = "#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      java = {
        disabled = true;
        symbol = " ";
        style = "#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      julia = {
        symbol = " ";
        style = "#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      nodejs = {
        symbol = "";
        style = "#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      nim = {
        symbol = "󰆥 ";
        style = "#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      rust = {
        symbol = "";
        style = "#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      scala = {
        symbol = " ";
        style = "#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      time = {
        disabled = false;
        time_format = "%R";
        style = "#33658A";
        format = "[ $time ]($style)";
      };
    };
  };
}

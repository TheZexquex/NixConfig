{ pkgs, config, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "pulseaudio/slider" "" ];
        modules-right = [ "" ];
        
     };
    };

    style = 
    ''
    
    '';
  };
}

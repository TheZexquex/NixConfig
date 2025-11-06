{ ... }: {
  programs.ashell ={
    enable = false;
    settings = {
      modules = {
        center = [
          "MediaPlayer"
        ];

        left = [
          "Workspaces"
          "WindowTitle"
        ];

        right = [
          "SystemInfo" 
          [
            "Tray"
            "Clock"
            "Privacy"
            "Settings"
          ]
        ]; 
      };
      appearance = {
        style = "Islands";
        font_name = "Ubuntu Nerd Font";
        scale_factor = 1.5;
        primary_color = "#7aa2f7";
        success_color = "#9ece6a";
        text_color = "#a9b1d6";
        workspace_colors = [ "#7aa2f7" "#9ece6a" ];
        special_workspace_colors = [ "#7aa2f7" "#9ece6a" ];

        menu = {
          opacity = 0.7;
          backdrop = 0.3;
        };
      };
    };
  };
}

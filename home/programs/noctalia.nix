{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  age.secrets.calendar-email.file = ../../secrets/calendar-email.age;

  programs.noctalia = let
    padding-global = 6;
    radius-global = 6;
    margin-global = 10;
  in {
    enable = true;

    systemd.enable = true;

    settings = {
      bar.order = ["main"];
      bar.main = {
        enable = true;
        position = "top";
        audo_hide = false;
        background_opacity = 0.95;

        thickness = 40;

        shadow = false;
        radius = radius-global;
        margin_ends = margin-global;
        widget_spacing = padding-global;
        padding = padding-global;

        font_family = "UbuntuMono Nerd Font";
        font_weight = "normal";

        capsule = true;
        capsule_radius = 5;
        capsule_padding = 10;
        capusle_thickness = 0.5;
        # capsule_border = "primary";

        start = [
          "control-center"
          "workspaces"
          "active_window"
          "notifications"
          "cat"
        ];

        center = [
          "audio_visualizer"
        ];

        end = [
          "tray"
          "volume"
          "sysmon"
          "network"
          "bluetooth"
          "clock"
        ];
      };

      control_center = {
        scale = 1.3;
        position = "close_to_bar_button";
        sidebar = "full";
        sidebar_section = "full";
      };

      audio = {
        enable_overdrive = true;
        enable_sounds = true;
        notification_sound = "${inputs.noctalia.packages.${pkgs.system}.default}/share/noctalia/assets/sounds/notification.wav";
        volume_change_sound = "${inputs.noctalia.packages.${pkgs.system}.default}/share/noctalia/assets/sounds/volume-change.wav";
      };

      calendar = {
        enabled = true;
        refresh_minutes = 10;

        account = {
          private_google = {
            type = "google";
            name = "Google";
          };
        };
      };

      dock = {
        enabled = false;
      };

      shell = {
        # UI
        corner_radius_scale = 0.5;
        font_family = "UbuntuMono Nerd Font";
        app_icon_colorize = false;

        # Lang and time
        time_format = "{:%H:%M:%S}";

        # Other
        avatar_path = "/home/thezexquex/avatar.png";

        animationDisabled = false;
        animationSpeed = 0.5;
        avatarImage = "/home/thezexquex/avatar.png";
        compactLockScreen = false;
        dimDesktop = true;
        enableShadows = false;
        forceBlackScreenCorners = false;
        language = "";
        lockOnSuspend = true;
        radiusRatio = 0.4;
        scaleRatio = 1.0;
        screenRadiusRatio = 1;
        shadowDirection = "bottom_right";
        showScreenCorners = false;

        panel = {
          open_near_click_control_center = true;
        };

        screenshot = {
          directory = "~/Pictures/Screenshots";
          filename_pattern = "Screenshot-%Y-%m-%d_%H-%M-%S";
          freeze_screen = true;
        };
      };

      widget = {
        clock = {
          format = "{:%b %e. - %H:%M:%S}";
        };

        tray = {
          drawer = true;
          drawer_columns = 3;
        };

        network = {
          show_label = false;
        };

        control-center = {
          custom_image = "${inputs.noctalia.packages.${pkgs.system}.default}/share/noctalia/assets/images/distros/nixos.svg";
          custom_image_colorize = true;
        };

        cat = {
          type = "noctalia/bongocat:cat";
          audio_spectrum = true;
          input_devices = ["/dev/input/by-id/*-event-*"];
          tappy_mode = true;
        };
      };

      hooks = {
        enabled = false;
        darkModeChange = "";
        wallpaperChange = "";
      };

      location = {
        adress = "Munich, Germany";
      };

      weather = {
        enabled = true;
        refresh_minutes = 10;
        unit = "metric";
        effects = true;
      };

      notifications = {
        enable_daemon = true;
        show_app_name = true;
        show_actions = true;
        position = "top_right";
        layer = "overlay";
        scale = 1.0;
        background_opacity = 0.95;
        offset_x = 20;
        offset_y = 8;
        collapse_on_dismiss = true;
        monitors = [];
      };

      plugins = {
        enabled = [
          "noctalia/screen_recorder"
          "noctalia/bongocat"
        ];

        source = {
          name = "official";
          kind = "git";
          location = "https://github.com/noctalia-dev/official-plugins";
          auto_update = false;
        };
      };

      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-content";

        templates = {
          enable_builtin_templates = true;
          buildin_ids = [];
        };
      };

      wallpaper = {
        enabled = true;
        default.path = "/home/thezexquex/Pictures/wallpapers/wallpaper/bloodrock-steppes.png";
        directory = "/home/thezexquex/Pictures/wallpapers";
        fill_color = "#000000";
        fill_mode = "crop";
      };
    };
  };
}

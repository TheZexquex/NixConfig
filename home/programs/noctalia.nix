{
  inputs,
  pkgs,
  lib,
  osConfig,
  ...
}:
let
 isTravelnix = osConfig.networking.hostName == "travelnix";
in {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # TODO: re-enable on travelnix once calendar-email.age is rekeyed for it
  age.secrets = lib.mkIf (osConfig.networking.hostName != "travelnix") {
    calendar-email.file = ../../secrets/calendar-email.age;
  };

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
        enabled = true;
        position = "top";
        auto_hide = false;
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
        capsule_thickness = 0.5;
        # capsule_border = "primary";

        start = [
          "control-center"
          "workspaces"
          "active_window"
          "notifications"
          "weather"
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
        ] ++ lib.optional isTravelnix "battery"
        ++ ["clock"];
      };

      control_center = {
        sidebar = "full";
        sidebar_section = "full";

        calendar.show_week_numbers = true;
      };

      audio = {
        enable_overdrive = true;
        enable_sounds = true;
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
        popup_shadows = false;

        animation = {
          enabled = true;
          speed = 0.5;
        };

        shadow.direction = "down_right";

        screen_corners.enabled = false;

        panel = {
          open_near_click_control_center = true;
          shadow = false;
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
        audio_visualizer = {
          mirrored = false;
        };
      };

      location = {
        address = "Munich, Germany";
      };

      weather = {
        enabled = true;
        refresh_minutes = 10;
        unit = "metric";
        effects = true;
      };

      lockscreen = {
        lock_before_suspend = true;
      };

      notification = {
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
          "noctalia/timer"
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
          builtin_ids = [];
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

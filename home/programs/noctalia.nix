{inputs, ...}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia-shell = {
    enable = true;
    settings = {
      appLauncher = {
        backgroundOpacity = 1.0;
        customLaunchPrefix = "";
        customLaunchPrefixEnabled = false;
        enableClipboardHistory = false;
        pinnedExecs = [];
        position = "center";
        sortByMostUsed = true;
        terminalCommand = "xterm -e";
        useApp2Unit = false;
      };

      audio = {
        cavaFrameRate = 60;
        mprisBlacklist = [];
        preferredPlayer = "";
        visualizerType = "linear";
        volumeOverdrive = false;
        volumeStep = 5;
      };

      bar = {
        backgroundOpacity = 1.0;
        density = "comfortable";
        exclusive = true;
        floating = true;
        marginHorizontal = 0.50;
        marginVertical = 0.50;
        monitors = [];
        outerCorners = true;
        position = "top";
        showCapsule = true;

        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "Workspace";
              hideUnoccupied = false;
              labelMode = "none";
            }
            {
              id = "ActiveWindow";
            }
          ];

          center = [
            {
              id = "AudioVisualizer";
            }
          ];

          right = [
            {id = "Volume";}
            {id = "SystemMonitor";}
            {id = "WiFi";}
            {id = "Bluetooth";}
            {
              id = "Clock";
              formatHorizontal = "HH:mm:ss";
              formatVertical = "HH mm ss";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };

      battery = {
        chargingMode = 0;
      };

      brightness = {
        brightnessStep = 5;
        enableDdcSupport = false;
        enforceMinimum = true;
      };

      colorSchemes = {
        darkMode = true;
        generateTemplatesForPredefined = true;
        manualSunrise = "06:30";
        manualSunset = "18:30";
        matugenSchemeType = "scheme-fruit-salad";
        predefinedScheme = "Catppuccin";
        schedulingMode = "off";
        useWallpaperColors = true;
      };

      controlCenter = {
        position = "close_to_bar_button";

        cards = [
          {
            id = "profile-card";
            enabled = true;
          }
          {
            id = "shortcuts-card";
            enabled = true;
          }
          {
            id = "audio-card";
            enabled = true;
          }
          {
            id = "weather-card";
            enabled = true;
          }
          {
            id = "media-sysmon-card";
            enabled = true;
          }
        ];

        shortcuts = {
          left = [
            {id = "WiFi";}
            {id = "Bluetooth";}
            {id = "ScreenRecorder";}
            {id = "WallpaperSelector";}
          ];

          right = [
            {id = "Notifications";}
            {id = "PowerProfile";}
            {id = "KeepAwake";}
            {id = "NightLight";}
          ];
        };
      };

      dock = {
        enabled = false;
        backgroundOpacity = 1.0;
        colorizeIcons = false;
        displayMode = "always_visible";
        floatingRatio = 1.0;
        monitors = [];
        onlySameOutput = true;
        pinnedApps = [];
        size = 1;
      };

      general = {
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
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        showScreenCorners = false;
      };

      hooks = {
        enabled = false;
        darkModeChange = "";
        wallpaperChange = "";
      };

      location = {
        name = "Munich, Germany";
        firstDayOfWeek = -1;
        analogClockInCalendar = false;
        monthBeforeDay = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        showWeekNumberInCalendar = true;
        use12hourFormat = false;
        useFahrenheit = false;
        weatherEnabled = true;
      };

      network = {
        wifiEnabled = true;
      };

      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        dayTemp = "6500";
        nightTemp = "4000";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };

      notifications = {
        enabled = true;
        backgroundOpacity = 1.0;
        location = "top_right";
        overlayLayer = true;
        respectExpireTimeout = false;
        doNotDisturb = false;
        monitors = [];
        criticalUrgencyDuration = 15;
        normalUrgencyDuration = 8;
        lowUrgencyDuration = 3;
      };

      osd = {
        enabled = true;
        autoHideMs = 2000;
        location = "top_right";
        overlayLayer = true;
        monitors = [];
      };

      screenRecorder = {
        directory = "";
        frameRate = 60;
        quality = "very_high";
        showCursor = true;
        videoCodec = "h264";
        videoSource = "portal";
        audioCodec = "opus";
        audioSource = "default_output";
        colorRange = "limited";
      };

      templates = {
        enableUserTemplates = true;
        alacritty = true;
        code = true;
        discord = false;
        discord_armcord = false;
        discord_dorion = false;
        discord_equibop = false;
        discord_lightcord = false;
        discord_vesktop = false;
        discord_webcord = false;
        foot = false;
        fuzzel = false;
        ghostty = false;
        gtk = true;
        kcolorscheme = true;
        kitty = false;
        pywalfox = true;
        qt = true;
        vicinae = true;
        walker = false;
        wezterm = false;
      };

      ui = {
        fontDefault = "UbuntuMono Nerd Font";
        fontDefaultScale = 1.0;
        fontFixed = "DejaVu Sans Mono";
        fontFixedScale = 1.0;
        panelsAttachedToBar = true;
        settingsPanelAttachToBar = false;
        tooltipsEnabled = true;
      };

      wallpaper = {
        enabled = true;
        defaultWallpaper = "/home/thezexquex/Pictures/wallpapers/wallpaper/bloodrock-steppes.png";
        directory = "/home/thezexquex/Pictures/wallpapers";
        enableMultiMonitorDirectories = false;
        fillColor = "#000000";
        fillMode = "crop";
        monitors = [];
        overviewEnabled = false;
        panelPosition = "follow_bar";
        randomEnabled = false;
        randomIntervalSec = 300;
        recursiveSearch = true;
        setWallpaperOnAllMonitors = true;
        transitionDuration = 1500;
        transitionEdgeSmoothness = 0.05;
        transitionType = "random";
      };
    };

    user-templates = ''
      [config]
      [templates.nvim-base16]
      input_path = "~/.config/nvim/lua/matugen-template.lua"
      output_path = "~/.config/nvim/lua/matugen.lua"
      post_hook = 'pkill -SIGUSR1 nvim'
    '';
  };
}

{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 5;

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "hyprland/window"
        ];

        modules-right = [
          "hyprland/language"
          "pulseaudio"
          "cpu"
          "memory"
          "clock"
          "tray"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "EN";
          format-ru = "RU";
        };

        clock = {
          format = "🕒 {:%H:%M | %d.%m.%Y}";
        };

        cpu = {
          format = "CPU {usage}%";
        };

        memory = {
          format = "RAM {}%";
        };

        pulseaudio = {
          format = "🔊 {volume}%";
        };

        tray = {
          spacing = 10;
        };
      };
    };

    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: "JetBrains Mono", "Noto Sans", sans-serif;
          font-size: 14px;
          min-height: 0;
      }

      window#waybar {
          background: rgba(26, 27, 38, 0.85);
          color: #c0caf5;
          border-bottom: 2px solid #7aa2f7;
      }

      #workspaces button {
          padding: 0 5px;
          background: transparent;
          color: #ffffff;
          border-bottom: 3px solid transparent;
      }

      #workspaces button.focused {
          background: #7aa2f7;
          color: #1a1b26;
          border-radius: 4px;
      }

      #clock, #cpu, #memory, #language, #pulseaudio, #tray {
          padding: 0 10px;
          margin: 4px 2px;
          background: #24283b;
          color: #f7768e;
          border-radius: 6px;
      }

      #language {
          color: #7ccdf4;
      }

      #clock {
          color: #bb9af7;
          font-weight: bold;
      }

      #tray {
          background: #414868;
      }
    '';
  };
}

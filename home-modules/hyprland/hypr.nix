{ pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
	  monitor = [
	    {
	  	  output = "DP-1";
	  	  mode = "2560x1440@240";
	  	  position = "0x0";
	  	  scale = "1";
	    }
	    {
	  	  output = "HDMI-A-1";
	  	  mode = "1920x1080@75";
	  	  position = "2560x450";
	  	  scale = "1";
	    }
	  ];
    
      mainMod = {
      	_var = "SUPER";
      };
      terminal = {
      	_var = "ghostty";
      };
      menu = {
      	_var = "rofi -show drun";
      };

      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline "function()\n  hl.exec_cmd(\"gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'\")\nend")
        ];
      };
      

	  config = {
	  	input = {
	  	  kb_layout = "us,ru";
	  	  kb_options = "grp:alt_shift_toggle";
	  	
	  	  follow_mouse = 1;
	  	  sensitivity = 0;
	  	};
	  };

      bind = [
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + 1\"")
        	(lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 1})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + SHIFT + 1\"")
        	(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 1})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + 2\"")
        	(lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 2})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + SHIFT + 2\"")
        	(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 2})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + 3\"")
        	(lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 3})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + SHIFT + 3\"")
        	(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 3})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + 4\"")
        	(lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 4})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + SHIFT + 4\"")
        	(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 4})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + 5\"")
        	(lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 5})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + SHIFT + 5\"")
        	(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 5})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + 6\"")
        	(lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 6})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + SHIFT + 6\"")
        	(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 6})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + 7\"")
        	(lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 7})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + SHIFT + 7\"")
        	(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 7})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + 8\"")
        	(lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 8})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + SHIFT + 8\"")
        	(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 8})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + 9\"")
        	(lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 9})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + SHIFT + 9\"")
        	(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 9})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + 0\"")
        	(lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 10})")
          ];
        }
        {
          _args = [
        	(lib.generators.mkLuaInline "mainMod .. \" + SHIFT + 0\"")
        	(lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 10})")
          ];
        }

        {
          _args = [
            (lib.generators.mkLuaInline "mainMod .. \" + mouse:272\"")
            (lib.generators.mkLuaInline "hl.dsp.window.drag()")
            (lib.generators.mkLuaInline "{ mouse = true }")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mainMod .. \" + mouse:273\"")
            (lib.generators.mkLuaInline "hl.dsp.window.resize()")
            (lib.generators.mkLuaInline "{ mouse = true }")
          ];
        }
        
      	{
      	  _args = [
      	  	(lib.generators.mkLuaInline "mainMod .. \" + T\"")
      	  	(lib.generators.mkLuaInline "hl.dsp.exec_cmd(terminal)")
      	  ];
      	}
      	{
      	  _args = [
      	  	(lib.generators.mkLuaInline "mainMod .. \" + Q\"")
      	  	(lib.generators.mkLuaInline "hl.dsp.window.close()")
      	  ];
      	}
      	
      	{
      	  _args = [
      	  	(lib.generators.mkLuaInline "mainMod .. \" + W\"")
      	  	(lib.generators.mkLuaInline "hl.dsp.exec_cmd(menu)")
      	  ];
      	}
      ];
    };
  };
}

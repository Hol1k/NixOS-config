{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi; 
    extraConfig = {
      modi = "drun,run,window";
      icon-theme = "Papirus";
      show-icons = true;
      terminal = "ghostty";
      drun-display-format = "{icon} {name}";
      disable-history = false;
      sidebar-mode = true;
    };
    theme = "gruvbox-dark";
  };
}

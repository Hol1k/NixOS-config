{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
	fontconfig = {
	  enable = true;
	  defaultFonts = {
	  	emoji = [ "Noto Color Emoji" ];
	  };
    
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
  
      nerd-fonts.jetbrains-mono   
      hack-font
  
      adwaita-icon-theme
      liberation_ttf
      
      urw-base35-fonts            
  
      font-awesome_6
  
      corefonts
    ];
  };
}

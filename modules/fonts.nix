{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
	fontconfig = {
	  enable = true;
	  defaultFonts = {
	  	emoji = [ "Noto Color Emoji" ];
	  };
	};
    
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji

      symbola
      freefont_ttf
  
      nerd-fonts.jetbrains-mono   
      hack-font
  
      adwaita-icon-theme
      liberation_ttf
      
      font-awesome_6
  
      unifont
      corefonts
    ];
  };
}

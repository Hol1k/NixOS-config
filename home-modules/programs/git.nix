{ pkgs, ... }:

{
	programs.git = {
	  enable = true;
	  settings = {
	  	user = {
	  	  name = "Hol1k";
	  	  email = "danilugryumov96@gmail.com";
	  	};
	  	credential.helper = "store";
	  };
	};
}

{ config, lib, pkgs, ... }:

let
	cfg = config.userSettings.programs."gtk-theme";
in
{
	options.userSettings.programs."gtk-theme".enable = lib.mkEnableOption "gtk-theme";

	config = lib.mkIf cfg.enable {
		gtk = {
			enable = true;

			theme = {
				name = "Adwaita-dark";
				package = pkgs.gnome-themes-extra;
			};

			iconTheme = {
				name = "Adwaita";
				package = pkgs.adwaita-icon-theme;
			};

			gtk3.extraConfig = {
				gtk-application-prefer-dark-theme = 1;
			};

			gtk4.extraConfig = {
				gtk-application-prefer-dark-theme = 1;
			};
		};

		dconf.settings."org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
			gtk-theme = "Adwaita-dark";
		};

		home.sessionVariables = {
			GTK_THEME = "Adwaita-dark";
		};
	};
}
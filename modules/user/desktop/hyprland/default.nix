{ config, lib, pkgs, ... }:

let
	cfg = config.userSettings.programs.hyprland;
in
{
	options.userSettings.programs.hyprland.enable = lib.mkEnableOption "hyprland";

	config = lib.mkIf cfg.enable {
		wayland.windowManager.hyprland = {
			enable = true;
			xwayland.enable = true;
		};
	};
}
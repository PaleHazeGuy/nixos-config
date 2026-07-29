{ config, lib, pkgs, ... }:

let
	cfg = config.userSettings.programs.screenshot;
in
{
	options.userSettings.programs.screenshot.enable = lib.mkEnableOption "screenshot";

	config = lib.mkIf cfg.enable {
		home.packages = [
			pkgs.grim
			pkgs.slurp
			pkgs.swappy
		];
	};
}
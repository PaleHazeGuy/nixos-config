{ config, lib, pkgs, ... }:

let
	cfg = config.userSettings.programs.zed-editor;
in
{
	options.userSettings.programs.zed-editor.enable = lib.mkEnableOption "zed-editor";

	config = lib.mkIf cfg.enable {
		home.packages = [ pkgs.zed-editor-fhs ];
	};
}
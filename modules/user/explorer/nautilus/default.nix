{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.programs.nautilus;
in
{
  options.userSettings.programs.nautilus.enable = lib.mkEnableOption "nautilus";

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.nautilus ];
  };
}
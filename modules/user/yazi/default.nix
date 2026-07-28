{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.programs.yazi;
in
{
  options.userSettings.programs.yazi.enable = lib.mkEnableOption "yazi";

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
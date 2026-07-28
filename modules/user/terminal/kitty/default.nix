{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.programs.kitty;
in
{
  options.userSettings.programs.kitty.enable = lib.mkEnableOption "kitty";

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
    };
  };
}
{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.programs.chromium;
in
{
  options.userSettings.programs.chromium.enable =
    lib.mkEnableOption "chromium";

  config = lib.mkIf cfg.enable {
    programs.chromium = {
      enable = true;
    };
  };
}
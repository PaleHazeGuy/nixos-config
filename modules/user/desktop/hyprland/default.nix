{ config, lib, helpers, pkgs, ... }:

let
  cfg = config.userSettings.programs.hyprland;
  apps = config.userSettings.defaultApps;
in
{
  options.userSettings.programs.hyprland.enable = lib.mkEnableOption "hyprland";

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      configType = "lua";

      extraLuaFiles = {
        "defaultApps" = {
          autoLoad = false;
          content = "return ${helpers.toLuaTable apps}";
        };
      };

      extraConfig = builtins.readFile ./dotlua/hyprland.lua;
    };

    home.file.".config/hypr/modules" = {
      source = ./dotlua/modules;
      recursive = true;
    };
  };
}
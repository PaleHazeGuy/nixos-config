{ config, ... }:

{
  imports = [ ./home.nix ../common ];

  userSettings = {
    programs = {
      neovim.enable = true;

      yazi.enable = true;
      nautilus.enable = true;

      kitty.enable = true;
      
      chromium.enable = true;

      hyprland.enable = true;
    };
  };
}
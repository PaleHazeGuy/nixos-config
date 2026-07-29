{ config, ... }:

{
  imports = [ ./home.nix ../common ];

  userSettings = {
    defaultApps = {
      terminal = "kitty";
      explorer = "nautilus";
    };

    programs = {
      neovim.enable = true;
      zed-editor.enable = true;

      yazi.enable = true;
      nautilus.enable = true;

      kitty.enable = true;
      
      chromium.enable = true;

      hyprland.enable = true;

			screenshot.enable = true;
    };
  };
}
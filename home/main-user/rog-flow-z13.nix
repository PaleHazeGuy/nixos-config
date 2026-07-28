{ config, ... }:

{
  imports = [ ./home.nix ../common ];

  userSettings = {
    programs = {
      neovim.enable = true;
    };
  };
}
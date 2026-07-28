{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.programs.neovim;
in
{
  options.userSettings.programs.neovim.enable = lib.mkEnableOption "neovim";

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      plugins = with pkgs.vimPlugins; [
        (nvim-treesitter.withPlugins (p: pkgs.tree-sitter.allGrammars))
      ];
    };
  };
}
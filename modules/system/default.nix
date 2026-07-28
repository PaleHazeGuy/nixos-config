{ lib, ... }:

let
  dir = ./.;
  entries = builtins.readDir dir;
  moduleDirs = builtins.attrNames (
    lib.filterAttrs
      (name: type: type == "directory" && builtins.pathExists (dir + "/${name}/default.nix"))
      entries
  );
in
{
  imports = map (name: dir + "/${name}") moduleDirs;
}
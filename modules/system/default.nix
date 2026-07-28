{ lib, ... }:

let
  findModules = dir:
    let
      entries = builtins.readDir dir;
    in
    lib.concatLists (lib.mapAttrsToList
      (name: type:
        let path = dir + "/${name}"; in
        if type == "directory" then
          if builtins.pathExists (path + "/default.nix")
          then [ path ]
          else findModules path
        else []
      )
      entries);
in
{
  imports = findModules ./.;
}
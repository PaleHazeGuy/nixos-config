{ lib, ... }:
{
  toLuaTable = attrs:
    "{\n" +
    (lib.concatStringsSep "\n"
      (lib.mapAttrsToList (name: value: "  ${name} = \"${value}\",") attrs))
    + "\n}";

  mkDotfiles = { dir, prefix }:
		lib.mapAttrs' (name: _:
			lib.nameValuePair "${prefix}/${name}" { source = dir + "/${name}"; }
		) (builtins.readDir dir);
}

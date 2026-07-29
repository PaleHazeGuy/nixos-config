{ lib, ... }:
{
  toLuaTable = attrs:
    "{\n" +
    (lib.concatStringsSep "\n"
      (lib.mapAttrsToList (name: value: "  ${name} = \"${value}\",") attrs))
    + "\n}";
}
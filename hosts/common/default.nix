# Common configuration for all hosts
{
  lib,
  inputs,
  outputs,
  secrets,
  ...
}: {
  imports = [ ../../modules/system ];
  
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
        secrets.main-user.User.Name
      ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
    registry =
      (lib.mapAttrs (_: flake: {inherit flake;}))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);
    nixPath = ["/etc/nix/path"];
  };

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    useOSProber = true;
    #efiInstallAsRemoveable = true;
    device = "nodev";
  };
  #boot.loader.systemd-boot.enable = true;
  boot.kernelModules = ["kvm-amd"];
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.${secrets.main-user.User.Name} = {
    isNormalUser = true;
    description = secrets.main-user.User.Description;
    extraGroups = ["networkmanager" "wheel"];
  };
}

{
  description = ''
    PaleHaze's Nixos
  '';

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  outputs = {
    self,
    home-manager,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
    secretsPath =
      if builtins.pathExists ./secrets/default.nix
      then ./secrets/default.nix
      else ./template-secrets/default.nix;
    secrets = import secretsPath;
  in {
    packages =
      forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    overlays = import ./overlays {inherit inputs;};
    nixosConfigurations = {
      rog-flow-z13 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs secrets;};
        modules = [./hosts/rog-flow-z13];
      };
    };
    homeConfigurations = {
      "${secrets.main-user.User.Name}@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs secrets;};
        modules = [./home/main-user/rog-flow-z13.nix];
      };
    };
  };
}

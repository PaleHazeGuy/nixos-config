{ lib, ... }:
{
	imports = [
		../common
		../../modules/system
		./configuration.nix
	];

	#systemSettings = (import ../../home/main-user/rog-flow-z13.nix).systemSettings;
}

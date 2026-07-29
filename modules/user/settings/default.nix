{ lib, ... }:
{
	options.userSettings = {
		defaultApps = {
			terminal = lib.mkOption {
				type = lib.types.str;
				default = "kitty";
				description = "Default terminal emulator";
			};
			explorer = lib.mkOption {
				type = lib.types.str;
				default = "nautilus";
				description = "Default file explorer";
			};
		};
	};
}
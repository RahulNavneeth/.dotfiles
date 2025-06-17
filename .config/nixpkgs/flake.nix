{
  description = "nix-darwin config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
  };

  outputs = { self, nixpkgs, nix-darwin, ... }@inputs:
	let
		system = "aarch64-darwin";
		user = "Rahuls-MacBook-Pro";
		pkgs = nixpkgs.legacyPackges.${system};
	in {
		darwinConfigurations.${user} = nix-darwin.lib.darwinSystem {
			system = system;
			modules = [
				./darwin-configuration.nix
			];
		};
	};
 }

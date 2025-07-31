# flake.nix
{
  description = "Моя NixOS + Illogical Impulse";

  inputs = {
    # Меняем канал на 24.05
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.05";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    illogical-impulse = {
      url = "github:bigsaltyfishes/end-4-dots";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, illogical-impulse, ... }:
    let system = "x86_64-linux"; in {
      nixosConfigurations.system = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./disko.nix
          ./home/configuration.nix
          home-manager.nixosModules.home-manager
          illogical-impulse.homeManagerModules.default
        ];
      };
      homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
        inherit system;
        modules = [ ./home-manager/home.nix ];
      };
    };
}

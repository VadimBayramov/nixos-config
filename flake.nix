# flake.nix
{
  description = "Моя NixOS + Illogical Impulse (end-4-dots)";

  inputs = {
    nixpkgs           = { url = "nixos-24.05"; };
    home-manager      = { url = "github:nix-community/home-manager"; };
    illogical-impulse = {
      url = "github:bigsaltyfishes/end-4-dots";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, illogical-impulse, ... }:
    let
      system = "x86_64-linux";
    in {
      # System-конфигурация (единственный «host»)
      nixosConfigurations.system = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./disko.nix                   # если нужна автоматическая разметка
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          illogical-impulse.homeManagerModules.default
        ];
      };

      # Домашняя конфигурация (необязательно)
      homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
        inherit system;
        modules = [ ./home-manager/home.nix ];
      };
    };
}

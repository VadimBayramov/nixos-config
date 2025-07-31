# flake.nix
{
  description = "Моя NixOS + Illogical Impulse (end-4-dots)";

  inputs = {
    nixpkgs           = { url = "nixos-25.05"; };
    home-manager      = { url = "github:nix-community/home-manager"; };
    illogical-impulse = {
      url = "github:bigsaltyfishes/end-4-dots";
      # чтобы flake illogical-impulse использовал тот же nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, illogical-impulse, ... }:
    let
      system = "x86_64-linux";
    in {
      # Единственная NixOS-конфигурация
      nixosConfigurations.system = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./disko.nix                                 # (по желанию) автоматическая разметка
          ./home/configuration.nix                    # теперь ваш системный конфиг
          home-manager.nixosModules.home-manager      # встроенный модуль Home-Manager
          illogical-impulse.homeManagerModules.default # модуль dot-files end-4-dots
        ];
      };

      # (Опционально) отдельная домашняя конфигурация через Home-Manager
      homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
        inherit system;
        modules = [ ./home-manager/home.nix ];
      };
    };
}

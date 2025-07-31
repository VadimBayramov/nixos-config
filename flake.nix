{
  description = "Моя NixOS + Illogical Impulse";

  inputs = {
    # Стабильный канал 24.05
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.05";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      # привязываем к тому же nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
    illogical-impulse = {
      url = "github:bigsaltyfishes/end-4-dots";
      # тоже используем тот же nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, illogical-impulse, ... }: let
    system = "x86_64-linux";
  in {
    # Сборка системы NixOS
    nixosConfigurations.system = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./disko.nix
        ./home/configuration.nix
        home-manager.nixosModules.home-manager
        illogical-impulse.homeManagerModules.default
      ];
    };

    # (Опционально) конфигурация Home-Manager для пользователя
    homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
      inherit system;
      modules = [ ./home-manager/home.nix ];
    };
  };
}

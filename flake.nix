{
  description = "NixOS config for Pavilion with Hyprland, PipeWire, Wine and needed apps";

  inputs = {
    # Основной набор пакетов NixOS 24.05 стабильный
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    # Home Manager для управления настройками пользователя
    home-manager.url = "github:nix-community/home-manager/release-24.05";

    # Репозиторий с конфигами и dotfiles Hyprland от end-4
    illogical-impulse.url = "github:end-4/dots-hyprland-nixos";
  };

  outputs = { self, nixpkgs, home-manager, illogical-impulse, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations.Pavilion = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./hosts/Pavilion.nix                            # Основной системный конфиг для Pavilion
          home-manager.nixosModules.home-manager          # Включаем home-manager как модуль NixOS
          illogical-impulse.homeManagerModules.default    # Модуль dotfiles и настроек Hyprland от end-4
        ];
      };
    };
}

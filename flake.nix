{
  description = "NixOS config for Pavilion with Hyprland, PipeWire, Wine and needed apps";

  inputs = {
    # Основной набор пакетов NixOS для версии 24.05
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    # Home Manager — управление пользовательскими конфигурациями
    home-manager.url = "github:nix-community/home-manager/release-24.05";

    # Если хочешь, можно добавить сюда flake с end-4 dots-hyprland (с твоей ссылкой)
    # Например:
    # dots-hyprland.url = "github:end-4/dots-hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";  # Архитектура системы
      pkgs = import nixpkgs { inherit system; };
    in
    {
      # Основная NixOS конфигурация под именем Pavilion
      nixosConfigurations.Pavilion = nixpkgs.lib.nixosSystem {
        inherit system;

        # Основные модули, загружаемые в систему
        modules = [
          # Твой хост-конфиг, где прописаны системные параметры
          ./hosts/Pavilion.nix

          # Интеграция Home Manager для управления пользовательскими настройками
          (home-manager.lib.homeManagerConfiguration {
            inherit system;
            username = "Diamond";  # Имя пользователя, под которым будет работать Home Manager
            homeDirectory = "/home/Diamond";  # Домашняя папка пользователя

            # Здесь подключаем файл с пользовательскими настройками (kitty, fish, dotfiles и т.д.)
            modules = [ ./home/Diamond.nix ];
          })
        ];
      };
    };
}

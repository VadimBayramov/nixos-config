{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix          # конфигурация железа (будешь дописывать)
    ./packages/00-bundle_of_packages.nix  # твои пакеты и приложения
    ./modules/00-bundle_of_modules.nix    # остальные модули (звук, hyprland, dotfiles и др.)
  ];

  networking.hostName = "sunless";           # hostname, можно заменить на нужный

  time.timeZone = "Europe/Moscow";         # часовой пояс

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8" "ru_RU.UTF-8" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # включаем experimental flakes и команды

  system.stateVersion = "23.05";            # версия состояния системы (важно для обновлений)
}

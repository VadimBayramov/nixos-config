{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages/00-bundle_of_packages.nix
    ./modules/00-bundle_of_modules.nix
  ];

  networking.hostName = "sunless";

  time.timeZone = "Europe/Moscow";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8" "ru_RU.UTF-8" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.05";

  # === END-4-DOTS BLOCK ===
  illogical-impulse = {
    enable = true;
    hyprland.enable = true;
    theme.enable = true;
    ags.enable = true;
    # Добавь другие нужные тебе опции, если они есть в документации
  };
}

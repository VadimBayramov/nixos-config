{ config, pkgs, lib, inputs, ... }:

{
  # ─── Импорты ───────────────────────────────────────────────────────────
  imports = [
    ./hardware-configuration.nix
    ./packages/00-bundle_of_packages.nix
    ./modules/00-bundle_of_modules.nix

    # поддержка HP Pavilion
    "${pkgs.path}/nixos/modules/installer/tools/nixos-hardware/hp-pavilion"
  ];

  # ─── Сеть, локали, время ───────────────────────────────────────────────
  networking.hostName      = "sunless";
  time.timeZone            = "Europe/Moscow";
  i18n.defaultLocale       = "en_US.UTF-8";
  i18n.supportedLocales    = [ "en_US.UTF-8" "ru_RU.UTF-8" ];

  # ─── flake-фичи и версия системы ───────────────────────────────────────
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion               = "24.05";

  # ─── Видео и драйверы ─────────────────────────────────────────────────
  services.xserver.videoDrivers        = [ "nvidia" ];
  hardware.opengl.enable               = true;
  hardware.nvidia.modesetting.enable   = true;
  hardware.nvidia.prime.offload.enable = true;

  # ─── UDisks2 (для монтирования внешних дисков через GVFS) ────────────
  services.udisks2.enable = true;

  # ─── Home-Manager как сервис ───────────────────────────────────────────
  services.home-manager.enable = true;

  # ─── Dot-files из end-4-dots ────────────────────────────────────────────
  illogical-impulse.enable = true;
}

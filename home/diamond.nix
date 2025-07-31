{ config, pkgs, ... }:

{
  # === Shell и терминалы ===
  programs.fish.enable = true;       # Fish shell
  programs.kitty.enable = true;      # Kitty терминал
  programs.vim.enable = true;        # Vim редактор

  # === Основные приложения для пользователя ===
  home.packages = with pkgs; [
    spotify
    telegram-desktop
    firefox
    tor-browser
    libreoffice
    remmina
    electrum
    wireguard-tools
    pea
    vlc
    discord
    wine
    git

    # === Файловый менеджер Thunar с автоподключением внешних носителей ===
    thunar                 # Сам файловый менеджер
    thunar-volman          # Поддержка автоподключения и монтирования
    gvfs                   # Необходим для работы Thunar с внешними накопителями
    udisks                 # Демон управления дисками
  ];

  # === PipeWire (через home-manager, дублирует системный, но конфликтов обычно нет) ===
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # === Flatpak для некоторых приложений, чтобы иметь свежие версии ===
  programs.flatpak.enable = true;

  home.file.".config/flatpak/overrides".text = ''
    [Context]
    shared=ipc,network,xdg-runtime
  '';

  # === Конфигурация end-4 dots-hyprland ===
  illogical-impulse = {
    enable = true;

    hyprland = {
      package = pkgs.hyprland;                             # Используем пакет Hyprland из nixpkgs
      xdgPortalPackage = pkgs.xdg-desktop-portal-hyprland; # Для правильной работы приложений на Wayland

      ozoneWayland.enable = true;                          # Включаем поддержку ozone-wayland (рекомендуется для Hyprland)
    };

    dotfiles = {
      anyrun.enable = true;   # dotfiles из набора end-4
      fish.enable = true;
      kitty.enable = true;
      # Можно добавить другие по необходимости
    };
  };
}

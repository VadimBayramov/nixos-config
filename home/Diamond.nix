{ config, pkgs, ... }:

{
  # Shell, терминал и редактор
  programs.fish.enable = true;
  programs.kitty.enable = true;
  programs.vim.enable = true;

  # Пакеты пользователя
  home.packages = with pkgs; [
    spotify
    firefox
    tor-browser
    libreoffice
    remmina
    electrum
    wireguard-tools
    peazip          # поправил название (pea → peazip)
    vlc
    discord
    wine
    git
  ];

  # Системные сервисы не включаются тут, но можно юзерские, если нужны (pipewire клиент)
  # Обычно PipeWire daemon включается на уровне системы
  # Здесь можно настроить клиентские утилиты, например:
  environment.variables = {
    PIPEWIRE_ENABLE = "1";  # если нужно
  };

  # Flatpak для свежих версий некоторых программ
  programs.flatpak.enable = true;
  home.file.".config/flatpak/overrides".text = ''
    [Context]
    shared=ipc,network,xdg-runtime
  '';

  # Конфигурация Hyprland (опционально)
  # Если хочешь, здесь можно добавить пользовательские конфиги и автозапуск:
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;  # твой локальный конфиг

  # Автоматический запуск программ в Hyprland через home manager
  # Можно добавить user units systemd для автозапуска (например, pipewire, wireplumber, polkit, dunst)
}

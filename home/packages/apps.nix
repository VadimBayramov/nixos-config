# === Основные приложения для пользователя ===
{ pkgs, ... }: {
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
  ];
}

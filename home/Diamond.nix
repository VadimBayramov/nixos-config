{ config, pkgs, ... }:

{
  programs.fish.enable = true;
  programs.kitty.enable = true;
  programs.vim.enable = true;

  home.packages = with pkgs; [
    spotify
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

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Flatpak (для Spotify и Discord, если нужны свежие версии)
  programs.flatpak.enable = true;
  home.file.".config/flatpak/overrides".text = ''
    [Context]
    shared=ipc,network,xdg-runtime
  '';
}

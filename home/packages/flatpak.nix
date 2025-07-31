{
  programs.flatpak.enable = true;

  home.file.".config/flatpak/overrides".text = ''
    [Context]
    shared=ipc,network,xdg-runtime
  '';
}

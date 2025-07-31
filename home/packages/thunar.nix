# === Файловый менеджер Thunar с автоподключением внешних носителей ===
{ pkgs, ... }: {
  home.packages = with pkgs; [
    thunar
    thunar-volman
    gvfs
    udisks
  ];
}

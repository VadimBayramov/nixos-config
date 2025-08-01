# === Файловый менеджер Thunar с автоподключением внешних носителей ===
{ pkgs, ... }: {
  home.packages = with pkgs; [
    thunar                 # Сам файловый менеджер
    thunar-volman          # Поддержка автоподключения и монтирования
    gvfs                   # Необходим для работы Thunar с внешними накопителями
    udisks                 # Демон управления дисками
  ];
}

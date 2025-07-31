{ pkgs, ... }: {
  users.users.diamond = {
    isNormalUser = true;
    description = "diamond";
    extraGroups = [
      "wheel"            # Sudo-доступ (администратор)
      "networkmanager"   # Управление сетью
      "audio"            # Звук
      "video"            # Видео/GPU/Webcam
      "input"            # Клавиатура/мышь/тачпад
      "libvirtd"         # Виртуальные машины (VirtManager)
      "docker"           # Docker (если появится)
      "plugdev"          # Подключаемые устройства (реже встречается)
      "lp"               # Принтеры
      "scanner"          # Сканеры
      "disk"             # Управление дисками (udisks2 и т.п.)
      "cdrom"            # Доступ к CD/DVD
      "tape"             # Ленты (если вдруг понадобится)
      "sys"              # Системные устройства (редко, но встречается)
      "camera"           # Для некоторых камер/программ (в Wayland)
      "render"           # GPU-рендер (Mesa, nouveau и пр.)
      "users"            # Группа пользователей (по умолчанию не вредит)
    ];
    packages = with pkgs; [ ];
  };

  services.getty.autologinUser = "diamond";
}

{
  imports = [
    ./bootloader.nix
    ./sound.nix        # ← Этого файла у тебя нет. Удалить или создать.
    ./zram.nix
    ./env.nix
    ./user.nix
    ./xserver.nix      # ← Этого файла у тебя тоже нет. Удалить или добавить.
    ./nm.nix           # ← Файла нет. Если нужна настройка NetworkManager — создай.
    ./virtmanager.nix
    ./hyprland.nix     # ← У тебя нет hyprland.nix. Создать, если используешь Hyprland.
    ./trim.nix
    ./bluetooth.nix
    ./nixvim/nixvim.nix
    ./git.nix
    ./htop.nix
    ./qt.nix
  ];
}

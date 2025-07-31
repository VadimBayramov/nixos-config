{
  imports = [
    ./bootloader.nix
    ./sound.nix
    ./zram.nix
    ./env.nix
    ./user.nix
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

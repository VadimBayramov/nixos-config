{ config, pkgs, ... }:

{
  # Импорт модуля для специфической поддержки железа HP Pavilion
  imports = [
    "${pkgs.path}/nixos/modules/installer/tools/nixos-hardware/hp-pavilion"
  ];

  # === X Server (графическая подсистема) ===
  services.xserver.enable = true;          # Включаем X сервер
  services.xserver.layout = "us,ru";       # Две раскладки: английская и русская
  services.xserver.xkbOptions = "grp:alt_shift_toggle";  # Переключение раскладки Alt+Shift

  # === Видеодрайверы и OpenGL ===
  services.xserver.videoDrivers = [ "nvidia" ];       # Проприетарный драйвер NVIDIA
  hardware.opengl.enable = true;                       # Включаем OpenGL
  hardware.nvidia.modesetting.enable = true;          # Kernel modesetting для NVIDIA
  hardware.nvidia.prime.offload.enable = true;        # Offloading для гибридных видеокарт Optimus

  # === Звук и PipeWire ===
  sound.enable = true;             # Базовая поддержка звука

  security.rtkit.enable = true;    # Реальное время для низкой задержки звука

  services.pipewire = {
    enable = true;                 # PipeWire — современный звуковой сервер
    alsa.enable = true;            # Поддержка ALSA
    alsa.support32Bit = true;      # 32-бит поддержка (для старых приложений и Wine)
    pulse.enable = true;           # Эмуляция PulseAudio для совместимости
  };

  # === Пользователь и группы ===
  users.users.Diamond = {
    isNormalUser = true;
    home = "/home/diamond";
    shell = pkgs.fish;             # Оболочка Fish
    extraGroups = [ "wheel" "video" "input" "audio" ];  # Доступ к видео, звуку и т.д.
  };

  # === Home Manager ===
  services.home-manager.enable = true;  # Включаем home-manager как сервис

  # === Сеть ===
  networking.firewall.enable = false;   # Фаервол выключен для домашней сети (по желанию)
}

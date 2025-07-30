{ config, pkgs, ... }:

{
  imports = [
    # Импортируем модуль для HP Pavilion — улучшенная поддержка железа (возможно, клавиатура, экран, тачпад и т.д.)
    "${pkgs.path}/nixos/modules/installer/tools/nixos-hardware/hp-pavilion"
  ];

  # === Графическая система ===

  services.xserver.enable = true;       # Включаем X сервер (нужен для запуска графической среды)
  services.xserver = {
  layout = "us,ru";                     # Добавляем сразу две раскладки: английская и русская
  xkbOptions = "grp:alt_shift_toggle";  # Переключение раскладок по Alt+Shift
};

  programs.hyprland.enable = true;      # Включаем Hyprland — современный композитор для Wayland

  # === Драйвер видеокарты NVIDIA ===

  services.xserver.videoDrivers = [ "nvidia" ];        # Используем проприетарный драйвер NVIDIA
  hardware.opengl.enable = true;                       # Включаем OpenGL (графический стек)
  hardware.nvidia.modesetting.enable = true;           # Включаем режим настройки ядра (kernel modesetting) — нужен для правильной загрузки и Hyprland
  hardware.nvidia.prime.offload.enable = true;         # Включаем возможность переключения между встроенной и дискретной графикой (если есть Optimus)

  # === Звук ===

  sound.enable = true;                 # Включаем базовую поддержку звука в NixOS

  # Устаревший способ включения PipeWire — удали это:
  # services.pipewire.enable = true;
  # services.pipewire.pulse.enable = true;
  # services.pipewire.media-session.enable = true;

  # Новый корректный способ — ниже 👇

  # Улучшает работу звука с низкой задержкой — полезно для FL Studio, VST, MIDI и т.д.
  security.rtkit.enable = true;

  # Настройка PipeWire — современный звуковой сервер, замена PulseAudio и JACK
  services.pipewire = {
    enable = true;               # Включает PipeWire
    alsa.enable = true;         # Включает поддержку ALSA (звуковые устройства)
    alsa.support32Bit = true;   # Нужен для 32-битных приложений (например, старые плагины VST через Wine)
    pulse.enable = true;        # PipeWire эмулирует PulseAudio — совместимость со старыми программами
  };

  # === Сеть ===

  networking.firewall.enable = false;   # Выключаем фаервол (для домашней сети, если сам контролируешь безопасность)
}

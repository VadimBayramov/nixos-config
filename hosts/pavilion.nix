{ config, pkgs, ... }:

{
  # Импорт модуля для специфической поддержки железа HP Pavilion
  imports = [
    "${pkgs.path}/nixos/modules/installer/tools/nixos-hardware/hp-pavilion"
  ];


  # === Видеодрайверы и OpenGL ===
  services.xserver.videoDrivers = [ "nvidia" ];       # Проприетарный драйвер NVIDIA
  hardware.opengl.enable = true;                       # Включаем OpenGL
  hardware.nvidia.modesetting.enable = true;          # Kernel modesetting для NVIDIA
  hardware.nvidia.prime.offload.enable = true;        # Offloading для гибридных видеокарт Optimus


  # === Home Manager ===
  services.home-manager.enable = true;  # Включаем home-manager как сервис

}

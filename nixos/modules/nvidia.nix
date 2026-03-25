{ config, pkgs, ... }:
{
  # RTX 5070 Ti — Blackwell, только open модули
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;  # обязательно для Blackwell
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  # Необходимо для Wayland + NVIDIA
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    LIBVA_DRIVER_NAME = "nvidia";
  };
}

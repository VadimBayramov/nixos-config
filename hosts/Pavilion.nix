{ config, pkgs, ... }:

{
  imports = [
    # драйвер NVIDIA и базовый hardware support
    "${pkgs.path}/nixos/modules/installer/tools/nixos-hardware/hp-pavilion"
  ];

  # базовая система и GUI
  services.xserver.enable = true;
  services.xserver.layout = "us";
  programs.hyprland.enable = true;

  # видеодрайвер NVIDIA
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.prime.offload.enable = true;

  # звук через PipeWire
  sound.enable = true;
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.media-session.enable = true;

  networking.firewall.enable = false;
}

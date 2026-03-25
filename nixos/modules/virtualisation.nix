{ pkgs, ... }:
{
  virtualisation.vmware.guest.enable = true;

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "vmware" ];
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.openbox.enable = true;

  services.accounts-daemon.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  programs.bash.loginShellInit = "";
}

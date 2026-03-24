{ pkgs, ... }:
{
  virtualisation.vmware.guest.enable = true;

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "vmware" ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
        user = "greeter";
      };
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
  };
}

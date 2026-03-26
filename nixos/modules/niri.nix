{ ... }:
{
  programs.niri.enable = true;
  services.seatd.enable = true;
  security.polkit.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "niri-session";
        user = "sunless";
      };
    };
  };
}

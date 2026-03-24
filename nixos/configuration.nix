{ inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/locale.nix
    ./modules/network.nix
    ./modules/virtualisation.nix
    ./modules/niri.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  environment.systemPackages = with pkgs; [
    git
    kitty
    wget
    curl
  ];

  users.users.sunless = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
  };

  services.openssh.enable = true;

  system.stateVersion = "25.11";
}

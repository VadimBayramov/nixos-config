{ config, pkgs, ... }: {
  imports = [
    ./apps.nix
    ./cli.nix
    ./thunar.nix
  ];
}

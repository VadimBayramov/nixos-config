{ pkgs, ... }: {
  home.packages = with pkgs; [
    thunar
    thunar-volman
    gvfs
    udisks
  ];
}

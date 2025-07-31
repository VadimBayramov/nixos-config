{ pkgs, ... }: {
  # === SHELL ===
  # Управление zsh и defaultUserShell отдаём на сторону illogical-impulse (end-4-dots)
  # programs.zsh.enable = true;
  # defaultUserShell = pkgs.zsh;

  users = {
    users.diamond = {
      isNormalUser = true;
      description = "diamond";
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" ];
      packages = with pkgs; [ ];
    };
  };

  # Включить автологин для diamond
  services.getty.autologinUser = "diamond";
}

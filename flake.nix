{
  description = "NixOS config for Pavilion with Hyprland, PipeWire, Wine and needed apps";

  inputs = {
    nixpkgs.url         = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url    = "github:nix-community/home-manager/release-24.05";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs   = import nixpkgs { inherit system; };
    in {
      nixosConfigurations.Pavilion = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/Pavilion.nix
          (home-manager.lib.homeManagerConfiguration {
            inherit system;
            username = "Diamond";
            homeDirectory = "/home/Diamond";
            modules = [ ./home/Diamond.nix ];
          })
        ];
      };
    };
}

{
  description = "NixOS config for Pavilion with Hyprland, PipeWire, Wine and needed apps";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    illogical-impulse.url = "github:bigsaltyfishes/end-4-dots";
    illogical-impulse.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, illogical-impulse, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations.Pavilion = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/pavilion.nix
          home-manager.nixosModules.home-manager
          illogical-impulse.homeManagerModules.default
        ];
      };
    };
}

{
  description = "Omni Opus";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nixos-wsl, ... }:
  let
    system = "x86_64-linux";
    stateVersion = "22.11";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    # NixOS - HOSTNAME
    # nixosConfigurations = (
    #   import ./hosts {
    #     inherit nixpkgs nixos-wsl;
    #   }
    # );

    # Home Manager - USERNAME
    homeConfigurations = {
      albalamia = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./users/adam.nix
        ];
      };
    };
  };
}
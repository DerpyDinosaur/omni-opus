# Walnut - Work PC
# Work

{ pkgs, nixos-wsl, home-manager, ... }:

{
  networking.hostName = "walnut";
  
  # Define user accounts
  users.users.si = {
    description = "Work Account";

    group = "users";
    extraGroups = [ "wheel" "docker" ];
    isNormalUser = true;
    useDefaultShell = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.si = import ../../users/si.nix;
  };

  # Installing Packages
  environment.systemPackages = with pkgs; [];
}
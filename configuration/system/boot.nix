{ pkgs, lanzaboote, ... }:

{
  # Disable the systemd-boot EFI boot loader
  # It is now managed by Lanzaboote
  boot.loader.systemd-boot.enable = true; # Temporarily reenabled until I setup secureboot again
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable Lanzaboote
#  boot.lanzaboote = {
#    enable = true;
#    pkiBundle = "/etc/secureboot";
#  };

  # Tooling for secureboot
  environment.systemPackages = [ pkgs.sbctl ];

  # Update kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
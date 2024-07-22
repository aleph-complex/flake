{ pkgs, lanzaboote, ... }:

{
  # Disable the systemd-boot EFI boot loader
  # It is now managed by Lanzaboote
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    timeout = 0; # Disables systemd-boot menu
  };

  # Enable Lanzaboote
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };

  # Tooling for secureboot
  environment.systemPackages = [ pkgs.sbctl ];

  # Update kernel to latest LTS
  boot.kernelPackages = pkgs.linuxPackages;
}

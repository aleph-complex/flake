{ pkgs, lanzaboote, ... }:

{
  # Disable the systemd-boot EFI boot loader
  # It is now managed by Lanzaboote
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 0; # Disables systemd-boot menu
  };

  boot.initrd.luks.devices.root.device = { "/dev/nvme0n1p2" };

  # Enable Lanzaboote
  #boot.lanzaboote = {
    #enable = true;
    #pkiBundle = "/etc/secureboot";
  #};

  # Prevent kernel tampering
  security.lockKernelModules = true;
  security.protectKernelImage = true;

  # Tooling for secureboot
  environment.systemPackages = [ pkgs.sbctl ];

  # Update kernel to latest LTS
  # boot.kernelPackages = pkgs.linuxPackages;
}

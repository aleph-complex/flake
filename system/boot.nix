{ pkgs, lanzaboote, ... }:

{
  # Disable the systemd-boot EFI boot loader
  # It is now managed by Lanzaboote
  boot.loader = {
    systemd-boot.enable = false;
    systemd-boot.editor = false;
    efi.canTouchEfiVariables = true;
    timeout = 0; # Disables systemd-boot menu
  };

  boot.kernelParams = ["quiet" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3"];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.initrd.systemd.enable = true;

  boot.initrd.luks.devices.root = {
    device = "/dev/nvme0n1p2";
    preLVM = true;
    crypttabExtraOpts = [ "tpm2-device=auto" ];
  };

  # Enable Lanzaboote
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };

  # Prevent kernel tampering
  security.lockKernelModules = true;
  security.protectKernelImage = true;

  # Tooling for secureboot and tpm2
  environment.systemPackages = [ pkgs.sbctl pkgs.tpm2-tss];

  # Update kernel to latest
  boot.kernelPackages = pkgs.linuxPackages_latest;
}

{ pkgs, lanzaboote, ... }:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = false; # Overidden by Lanzaboote
        editor = false; # Disable kernel command line editor
      };
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    initrd = {
      #verbose = false; # Quiet boot
      systemd.enable = true; # TPM2 unlock
      luks.devices.root = {
        device = "/dev/nvme0n1p2";
        preLVM = true;
        crypttabExtraOpts = [ "tpm2-device=auto" ];
      };
    };

    # Secure boot support
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    # Quiet boot
    #kernelParams = [
    #  "quiet"
    #  "rd.systemd.show_status=false"
    #  "rd.udev.log_level=3"
    #  "udev.log_priority=3"
    #];
    #consoleLogLevel = 0;

    # Update to latest kernel
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Prevent kernel tampering
  security.lockKernelModules = true;
  security.protectKernelImage = true;

  # Tooling for secureboot and tpm2
  environment.systemPackages = [ pkgs.sbctl pkgs.tpm2-tss];
}

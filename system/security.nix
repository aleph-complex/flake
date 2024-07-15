{
  # Enable firewall and block all ports
  networking.firewall.enable = true;
  networking.firewall.allowPing = false;
  networking.firewall.allowedTCPPorts = [];
  networking.firewall.allowedUDPPorts = [];

  # Disable coredump cause who needs crash reports
  systemd.coredump.enable = false;

  # Enable ClamAV and keep it updated
  services.clamav = {
    daemon.enable = true;
    updater.enable = true;
    scanner.enable = true;
  };

  # Prevent kernel tampering
  security.lockKernelModules = true;
  security.protectKernelImage = true;

  # Enable AppArmor and allow it to kill new programs
  security.apparmor.enable = true;
  security.apparmor.killUnconfinedConfinables = true;

  # Allows full control over all network connections
  # Still deciding if it's a nuisance or worth it
  # services.opensnitch.enable = true;

  # Thank you Solène Rapenne and the hardened.nix team
}
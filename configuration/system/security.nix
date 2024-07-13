{
  # Enable firewall and block all ports
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [];
  networking.firewall.allowedUDPPorts = [];

  # Disable coredump cause who needs crash reports
  systemd.coredump.enable = false;

  # Enable ClamAV and keep it updated
  services.clamav.daemon.enable = true;
  services.clamav.updater.enable = true;

  # Prevent kernel tampering
  security.lockKernelModules = true;
  security.protectKernelImage = true;

  # Enable AppArmor and allow it to kill new programs
  security.apparmor.enable = true;
  security.apparmor.killUnconfinedConfinables = true;

  # Enable strict reverse path filtering
  boot.kernel.sysctl."net.ipv4.conf.all.log_martians" = true;
  boot.kernel.sysctl."net.ipv4.conf.all.rp_filter" = "1";
  boot.kernel.sysctl."net.ipv4.conf.default.log_martians" = true;
  boot.kernel.sysctl."net.ipv4.conf.default.rp_filter" = "1";

  # Ignore broadcast ICMP
  boot.kernel.sysctl."net.ipv4.icmp_echo_ignore_broadcasts" = true;

  # Ignore incoming ICMP redirects (note: default is needed to ensure that the
  # setting is applied to interfaces added after the sysctls are set)
  boot.kernel.sysctl."net.ipv4.conf.all.accept_redirects" = mkDefault false;
  boot.kernel.sysctl."net.ipv4.conf.all.secure_redirects" = mkDefault false;
  boot.kernel.sysctl."net.ipv4.conf.default.accept_redirects" = mkDefault false;
  boot.kernel.sysctl."net.ipv4.conf.default.secure_redirects" = mkDefault false;
  boot.kernel.sysctl."net.ipv6.conf.all.accept_redirects" = mkDefault false;
  boot.kernel.sysctl."net.ipv6.conf.default.accept_redirects" = mkDefault false;

  # Ignore outgoing ICMP redirects
  boot.kernel.sysctl."net.ipv4.conf.all.send_redirects" = mkDefault false;
  boot.kernel.sysctl."net.ipv4.conf.default.send_redirects" = mkDefault false;

  # Allows full control over all network connections
  # Still deciding if it's a nuisance or worth it
  # services.opensnitch.enable = true;

  # Thank you Solène Rapenne and the hardened.nix team
}
{
  # Define hostname and enable networking
  networking.hostName = "complex";
  networking.networkmanager.enable = true;

  # Enable firewall and block all ports
  networking.firewall.enable = true;
  networking.firewall.allowPing = false;
  networking.firewall.allowedTCPPorts = [];
  networking.firewall.allowedUDPPorts = [];
}
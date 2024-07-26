{
  networking = {
    # Define hostname and enable networking
    hostName = "complex";
    networkmanager.enable = true;
  
    # Enable firewall and block all ports
    firewall = {
      enable = true;
      allowPing = false;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
  };
}
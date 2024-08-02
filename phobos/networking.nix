{
  networking = {
    # Define hostname and enable networking
    hostName = "phobos";
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
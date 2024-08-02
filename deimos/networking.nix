{
  networking = {
    hostName = "deimos";
    computerName = "deimos";
    localHostName = "deimos";
    dns = [
      "9.9.9.9" # Quad9
      "2620:fe::fe"
      "1.1.1.2" # Cloudflare DNS for Families (Malware)
      "2606:4700:4700::1112"
    ];
    knownNetworkServices = [
      "USB 10/100/1000 LAN"
      "USB 10/100/1000 LAN 2"
      "Thunderbolt Bridge"
      "Wi-Fi"
    ];
  };
}
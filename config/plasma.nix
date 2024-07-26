{ pkgs, ... }:

{
  # Enable KDE Plasma 6 and SDDM
  services = {
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true; # Enable Wayland support for SDDM
    };
  };

  # Disable KDE NetworkManager applet (Breaks wifi??)
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-nm
  ];
}

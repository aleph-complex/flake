{ pkgs, ... }:

{
  # Enable KDE desktop
  services.desktopManager.plasma6.enable = true;

  # Enable SDDM for login and session management
  services.displayManager.sddm.enable = true;

  # Enable SDDM Wayland support
  services.displayManager.sddm.wayland.enable = true;

  # Disable KDE NetworkManager applet (Breaks wifi??)
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-nm
  ];
}

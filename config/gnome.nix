{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    excludePackages = [ pkgs.xterm ];
  };

  environment.gnome.excludePackages = (with pkgs; [
    # for packages that are pkgs.*
    gnome-tour
    gnome-connections
    epiphany # web browser
    evince # document viewer
    geary
    cheese
    seahorse
    yelp
    simple-scan
  ]) ++ (with pkgs.gnome; [
    # for packages that are pkgs.gnome.*
    gnome-calendar
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-maps
    gnome-weather
  ]);

  environment.systemPackages = [ pkgs.gnomeExtensions.appindicator pkgs.gnome-tweaks ];
}

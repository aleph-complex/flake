{ pkgs, nixpkgs, ... }:

{
  # Install Chromium
  environment.systemPackages = [ pkgs.chromium ];

  # Enable Wayland for Electron/Chromium
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enable WideVine for DRM protected content
  nixpkgs.config.chromium.enableWideVine = true;
}
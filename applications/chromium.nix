{ pkgs, nixpkgs, ... }:

{
  # Install Chromium
  environment = {
    systemPackages = [ pkgs.chromium ];

    # Enable Wayland for Electron/Chromium
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  # Enable WideVine for DRM protected content
  nixpkgs.config.chromium.enableWideVine = true;

  # This probably makes it safer
  security.chromiumSuidSandbox.enable = true;

  # Enable firejail and sandbox Chromium
  programs.firejail = {
    enable = true;
    wrappedBinaries.chromium = {
      executable = "${pkgs.lib.getBin pkgs.chromium}/bin/chromium";
      profile = "${pkgs.firejail}/etc/firejail/chromium.profile";
    };
  };
}
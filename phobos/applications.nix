{ pkgs, inputs, ... }:

{
  # Installs desktop applications
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1"; # Enable Wayland for Electron/Chromium

    systemPackages = (with pkgs; [
      # Desktop applications
      vesktop # Custom discord client
      vscodium # MS-less build of VS Code
      chromium # Chrome minus the Google

      # CLI programs
      git # Version management
      gh # GitHub CLI
      aria2 # Downloads things
      btop # System monitor
    ]);
  };

  # Enables comma wrapped by nix-index-database
  programs.nix-index-database.comma.enable = true;

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
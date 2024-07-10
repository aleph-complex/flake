{
  # Enable PipeWire for audio
  security.rtkit.enable = true; # Security features
  hardware.pulseaudio.enable = false; # Makes sure pulseaudio isn't enabled
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Define hostname and enable networking
  networking.hostName = "complex";
  networking.networkmanager.enable = true;

  # Enables bluetooth
  hardware.bluetooth.enable = true;
  # hardware.bluetooth.powerOnBoot = true;

  # Set time zone
  time.timeZone = "America/Denver";
}
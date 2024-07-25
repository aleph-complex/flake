{
  # Enable PipeWire for audio
  security.rtkit.enable = true; # Security features
  hardware.pulseaudio.enable = false; # Makes sure pulseaudio isn't enabled
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Enables bluetooth
  hardware.bluetooth.enable = true;

  # Set time zone
  time.timeZone = "America/Denver";
}
{
  # Enable bluetooth and disable pulseaudio
  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
  };
  
  # Enable PipeWire and additional backends
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true; # Security features

  time.timeZone = "America/Denver";
}
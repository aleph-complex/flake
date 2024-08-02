{
  # Enable bluetooth and disable pulseaudio
  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
  };
  
  # Enable system services
  services = {
    # Audio backend
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    # Enhanced scheduler
    system76-scheduler.enable = true;
  };

  security.rtkit.enable = true; # Security features

  time.timeZone = "America/Denver";
}
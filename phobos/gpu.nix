{ pkgs, ... }:

{
  hardware.amdgpu.opencl.enable = true; # Enable OpenGL support via ROCm
  programs.tuxclocker.enable = true; # Tuning and monitoring
  environment.systemPackages = [ pkgs.zluda ]; # Enable CUDA support via ZLUDA
}
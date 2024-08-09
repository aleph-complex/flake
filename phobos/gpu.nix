{ pkgs, ... }:

{
  hardware.amdgpu.opencl.enable = true; # Enable OpenGL support via ROCm
  # environment.systemPackages = [ pkgs.zluda ]; # Enable CUDA support via ZLUDA
}
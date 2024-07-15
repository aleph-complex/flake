{ pkgs, ... }:

{
  # Installs desktop applications
  environment.systemPackages = (with pkgs; [
    vesktop # Custom discord client
    vscodium # MS-less build of VS Code
  ]) ++ (with pkgs.kdePackages; [
    partitionmanager # Manages partitions
    filelight # Disk usage visualizer
  ]);
}
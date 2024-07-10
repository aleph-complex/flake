{ pkgs, ... }:

{
  # Steam:tm:
  programs.steam = {
    enable = true;
  };

  # Installs other gaming related packages
  environment.systemPackages = (with pkgs; [
    heroic # Epic and GoG launcher
    protonup-qt # Installs proton versions
  ]);
}
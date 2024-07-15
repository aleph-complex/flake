{ pkgs, ... }:

{
  # Installs command line tools
  environment.systemPackages = (with pkgs; [
    git # Version management
    gh # GitHub CLI
    aria2 # Downloads things
    btop # System monitor
  ]);
}
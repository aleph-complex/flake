{ pkgs, ... }:

{
  # Installs command line tools
  environment.systemPackages = (with pkgs; [
    git # Version management
    gh # Github CLI
    wget # Downloads things
  ]);
}
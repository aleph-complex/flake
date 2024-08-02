{ pkgs, ... }:

{
  # List packages installed in system profile
  # environment.systemPackages = with pkgs; [ ];

  # Create /etc/zshrc that loads the nix-darwin environment
  programs.zsh.enable = true;

  # Enables comma wrapped by nix-index-database
  programs.nix-index-database.comma.enable = true;
}
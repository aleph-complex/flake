{
  homebrew = {
    enable = true;
    casks = [
      "vscodium"
      "discord"
      # "bitwarden"
      # "iterm2@beta"
    ];
    onActivation = {
      cleanup = "zap";
    };
  };
}

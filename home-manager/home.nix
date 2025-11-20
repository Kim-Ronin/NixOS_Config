{

  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "kim";
    homeDirectory = "/home/kim";
    stateVersion = "25.05";
  };
}

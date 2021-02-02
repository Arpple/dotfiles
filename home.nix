{ config, pkgs, ... }:

let 
  user = "arpple";
  email = "apple0239@gmail.com";
  homeDir = "/home/arpple";

in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "21.03";

  home.username = user;
  home.homeDirectory = homeDir;

  news.display = "silent";

  home.packages = with pkgs; [
    git
    starship
    emacs
     
    # doom-emacs deps
    (ripgrep.override { withPCRE2 = true; })
    fd
    imagemagick
    zstd
    editorconfig-core-c
    sqlite
    nodePackages.javascript-typescript-langserver
  ];

  programs.git = {
    enable = true;
    userName = user;
    userEmail = email;
  };
  
  fonts.fontconfig.enable = true;
}

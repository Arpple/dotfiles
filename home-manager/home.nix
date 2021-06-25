{ config, pkgs, ... }:

let 
  user = "arpple";
  email = "apple0239@gmail.com";
  homeDir = "/home/arpple";

  projectHiddenDir = ".arpple";
  binDir = ../bin;

  any-nix-shell = pkgs.fetchFromGitHub {
    owner = "haslersn";
    repo = "any-nix-shell";
    rev = "v1.2.1";
    sha256 = "0q27rhjhh7k0qgcdcfm8ly5za6wm4rckh633d0sjz87faffkp90k";
  };

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
    any-nix-shell
    direnv

    # doom-emacs deps
    (ripgrep.override { withPCRE2 = true; })
    fd
    imagemagick
    zstd
    editorconfig-core-c
    sqlite
    nodejs
    php
    nodePackages.javascript-typescript-langserver
    nodePackages.eslint
  ];

  programs.git = {
    enable = true;
    userName = user;
    userEmail = email;

    ignores = [ projectHiddenDir ];

    extraConfig = {
      credential.helper = "store";
    };

    aliases = {
      root-dir = "rev-parse --show-toplevel";
    };
  };

  fonts.fontconfig.enable = true;
}

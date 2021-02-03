{ config, pkgs, ... }:

let 
  user = "arpple";
  email = "apple0239@gmail.com";
  homeDir = "/home/arpple";

  projectHiddenDir = ".arpple";

  any-nix-shell = pkgs.fetchFromGitHub {
    owner = "haslersn";
    repo = "any-nix-shell";
    rev = "v1.2.0";
    sha256 = "05xixgsdfv0qk648r74nvazw16dpw49ryz8dax9kwmhqrgkjaqv6";
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

    # doom-emacs deps
    (ripgrep.override { withPCRE2 = true; })
    fd
    imagemagick
    zstd
    editorconfig-core-c
    sqlite
    nodejs
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

  programs.fish = {
    enable = true;

    plugins = [

    ];

    shellAliases = {
      arp-nix = "nix-shell (git root-dir)/${projectHiddenDir}/shell.nix";
    };

    promptInit = ''
      fish_vi_key_bindings
      any-nix-shell fish | source
      set fish_greeting
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      git_branch = {
        format = "[$symbol$branch]($style) ";
        symbol = " ";
        style = "green";
      };

      package = {
        disabled = true;
      };

      nix_shell = {
        style = "cyan";
        format = "[nix-$state]($style) ";
      };

      character = {
        success_symbol = "\\(・ω・\\)ﾉ";
        error_symbol = "\\(;゜Д゜\\)";
        vicmd_symbol = "\\(´ ▽ `\\)v";
      };

      cmd_duration = {
        disabled = true;
      };
    };
  };
}

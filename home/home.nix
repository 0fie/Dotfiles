{ config, pkgs, inputs, ... }:

{
  imports = [
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./dconf.nix
    ./firefox.nix
    ./git.nix
    ./gtk.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./kitty.nix
    ./lf.nix
    ./mako.nix
    ./nautilus.nix
    ./neofetch.nix
    ./nixvim.nix
    ./rofi.nix
    ./services.nix
    ./spotify.nix
    ./starship.nix
    ./tools.nix
    ./waybar.nix
    ./xdg.nix
    ./zathura.nix
    ./zsh.nix
    inputs.hypridle.homeManagerModules.hypridle
    inputs.hyprlock.homeManagerModules.hyprlock
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
  ];

  # Info required by home-manager.
  home = {
    username = "me";
    homeDirectory = "/home/me";
    stateVersion = "23.11";
  };

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  programs.home-manager.enable = true;
}

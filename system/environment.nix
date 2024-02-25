{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      zip
      unzip
      wl-clipboard
      git
      neovim
      ntfs3g
    ];

    variables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      NIXOS_OZONE_WL = "1";
    };
  };
}

{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [ zip unzip wl-clipboard git neovim ntfs3g ];
  };
}

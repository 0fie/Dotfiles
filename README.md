<h1 align="center">
   <img src="https://github.com/0fie/Dotfiles/assets/151028199/6da7fe65-6661-4bb6-b5bc-b72aa6d79a7a" width="100px" /> 
   <br>
      0fie's ultra-simple NixOS config 
   <br>
      <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
   <div align="center">

   <div align="center">
      <p></p>
      <div align="center">
         <a href="https://github.com/0fie/Dotfiles/stargazers">
            <img src="https://img.shields.io/github/stars/0fie/Dotfiles?color=F5BDE6&labelColor=303446&style=for-the-badge&logo=starship&logoColor=F5BDE6">
         </a>
         <a href="https://github.com/0fie/Dotfiles/">
            <img src="https://img.shields.io/github/repo-size/0fie/Dotfiles?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=github&logoColor=C6A0F6">
         </a>
         <a = href="https://nixos.org">
            <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=303446&logo=NixOS&logoColor=white&color=91D7E3">
         </a>
         <a href="https://github.com/0fie/Dotfiles/blob/main/LICENSE">
            <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=313244&colorB=F5A97F&logo=unlicense&logoColor=F5A97F&"/>
         </a>
      </div>
      <br>
   </div>
</h1>

<br>
</div>

<p align="center">
   <img src="https://github.com/0fie/Dotfiles/blob/main/docs/images/rice/rice.png" width="800px" /> <br>
</p>
<p align="center">
   Screenshot last updated <b>20 March</b>
</p>

### 🖼️ Gallery

<details>
   <summary>
      Current (Expand)
   </summary>
   <p align="center">
      Kitty + Nushell + Starship + Cava
      <img src="https://github.com/0fie/Dotfiles/blob/main/docs/images/rice/term.png" width="800px" /> <br>
   </p>

   <p align="center">
      Hyprlock (lock screen)
      <img src="https://github.com/0fie/Dotfiles/blob/main/docs/images/rice/lock.png" width="800px" /> <br>
   </p>
   <p align="center">
      App Launcher (rofi-wayland)
      <img src="https://github.com/0fie/Dotfiles/blob/main/docs/images/rice/rofi.png" width="800px" /> <br>
   </p>
   <p align="center">
      Helix Editor (left) and Yazi (right)
      <img src="https://github.com/0fie/Dotfiles/blob/main/docs/images/rice/cli.png" width="800px" /> <br>
   </p>

</details>

<details>
  <summary>More Pics</summary>
  <p>Just kidding, please star the repo lol lol 😅</p>
</details>

### 📓 Components
| Type                        | Program                                                                                       |
| --------------------------- | :---------------------------------------------------------------------------------------------:
| **Compositor**              | [Hyprland][Hyprland] |
| **Lock screen**             | [Hyprlock][Hyprlock] |
| **Idle Mgmt. Daemon**       | [Hypridle][Hypridle] |
| **Wallpaper Setter**        | [Hyprpaper][Hyprpaper] |
| **Text Editor**             | [Helix][Helix] |
| **Shell**                   | [Nushell][Nushell] + [Starship][Starship] |
| **Terminal Emulator**       | [Kitty][Kitty] |
| **Notification Daemon**     | [Mako][Mako] |
| **File Manager**            | [Yazi][Yazi] |
| **Color Scheme**            | [Catppuccin][Catppuccin] |
| **Screenshot Software**     | [Grimblast][Grimblast] |
| **Application Launcher**    | [rofi-wayland][rofi-wayland] |
| **Music Player**            | [Spotify][Spotify] |
| **Bar**                     | [Waybar][Waybar] |
| **Network Mgmt. Tool**      | [NetworkManager][NetworkManager] + [network-manager-applet][network-manager-applet] |
| **System resource monitor** | [Btop][Btop] |
| **Cursor**                  | [Bibata-Modern-Ice][Bibata-Modern-Ice] |
| **Icons**                   | [catppuccin-papirus-folders][catppuccin-papirus-folders] |
| **Image Viewer**            | [Loupe][Loupe] |
| **Media Player**            | [VLC][VLC] |
| **Screen Recording**        | [vokoscreenNG][vokoscreenNG] |
| **Clipboard**               | [wl-clipboard][wl-clipboard] |
| **Office Suite**            | [LibreOffice][LibreOffice] |

<br>

### 📚 Directory Structure
| File/Dir                   | What it does
|----------------------------| :------------------------------------------------------:
| [flake.nix](flake.nix) ❄️   | base of the configuration |
| [home/](home/) 🏠️          | contains home-manager configs for the user, like themes |
| [system/](system/) ⚙️       | contains system-level OS configs like file system & boot. |
| [docs/](docs/) 📚️          | the documentation: explains how to do x, what option y does, etc. |

<br>

### Why it looks like this?
Simplicity. As a simple person with simple requirements, I sought to craft a beautiful and functional NixOS + Hyprland config to daily
drive on my old Dell laptop, and this is it! It might look half-baked or "insufficient" but I can assure you that it meets my needs perfectly,
and there is nothing more to add to it. You will notice that the [home](home/) and [system](system/) directories do not contain any
additional directories inside them. This was intentionally done to avoid unnecessary complexity. You can open an
[issue](https://github.com/0fie/Dotfiles/issues/new) if you face trouble with the dotfiles.

<br>

## How to Install?
I'm still figuring out how to make it safe and convenient for others to install these dotfiles on their NixOS (and non-nix) machines.
Progress is a bit slow due to time constraints on my side. However, the plan is to refactor the flake so that you can install just the
home-manager configuration without having to include the rest of my OS configs. This means you can create another user on your system
just to test out these configs, all without tampering with your existing setup. So for now, you should cherry pick the parts that you're
interested in. For example, if you want to add my Hyprland config to your setup, you'd simply copy my [home/hyprland.nix](home]hyprland.nix)
file into your dotfiles directory and then import it.    

#### If you're not using Nix or NixOS
Go to the [releases](https://github.com/0fie/Dotfiles/releases). The [v1.0.0-other-distros](https://github.com/0fie/Dotfiles/releases/download/v1.0.0-other-distros/v1.0.0-other-distros.tar) archive contains regular .conf files for Hyprland,
Kitty and more!

<hr>

### I got a lot of inspiration as well as actual code from the following sources:
- [Aylur/dotfiles](https://github.com/Aylur/dotfiles) - Nushell configs
- [NotAShelf/Nyx](https://github.com/NotAShelf/Nyx) - dozens of snippets from their ultra-complex setup
- [Misterio77/nix-config](https://github.com/Misterio77/nix-config) - their Firefox declaration with addons
- [rubyowo/dotfiles](https://github.com/rubyowo/dotfiles) - bat & cava configs
- [My Linux For Work Dotfiles 2.7 - 2.8](https://gitlab.com/stephan-raabe/dotfiles) - Inspiration for hyprlock and hypridle
- [isabelroses/dotfiles](https://github.com/isabelroses/dotfiles/) - Catppuccin for SDDM
- [prasanthrangan/hyprdots](https://github.com/prasanthrangan/hyprdots) - their Hyprland animations
- [Frost-Phoenix/nixos-config](Frost-Phoenix/nixos-config) - Configs for Maxfetch, Starship, Kitty, Waybar & Hyprland window rules
- [fufexan/dotfiles](https://github.com/fufexan/dotfiles) - Configs for Spicetify, Hypridle and more


### Other learning resources that have also been helpful
- [NixOS and Flakes Book](https://nixos-and-flakes.thiscute.world)
- [NixOS Discord](https://discord.com/invite/2HeKRM3)
- [Zero to Nix](https://zero-to-nix.com)
- [Vimjoyer's Nix playlist](https://www.youtube.com/playlist?list=PLko9chwSoP-15ZtZxu64k_CuTzXrFpxPE)
- [Zaney's Blog](https://zaney.org/)
- [IogaMaster's channel](https://www.youtube.com/@IogaMaster)

###### Special thanks to [NobbZ](https://github.com/NobbZ) for answering all my questions on Discord.

<!-- links -->
[Hyprland]: https://github.com/hyprwm/Hyprland
[Kitty]: https://github.com/kovidgoyal/kitty
[Starship]: https://github.com/starship/starship
[Waybar]: https://github.com/Alexays/Waybar
[Btop]: https://github.com/aristocratos/btop
[grimblast]: https://github.com/hyprwm/contrib
[Mako]: https://github.com/emersion/mako
[Nerd fonts]: https://github.com/ryanoasis/nerd-fonts
[NetworkManager]: https://wiki.gnome.org/Projects/NetworkManager
[network-manager-applet]: https://gitlab.gnome.org/GNOME/network-manager-applet/
[wl-clipboard]: https://github.com/bugaevc/wl-clipboard
[Catppuccin]: https://github.com/catppuccin/catppuccin
[catppuccin-papirus-folders]: https://github.com/catppuccin/papirus-folders
[Nushell]: https://www.nushell.sh
[rofi-wayland]: https://github.com/lbonn/rofi
[Helix]: https://helix-editor.com/
[Yazi]: https://github.com/sxyazi/yazi
[Hypridle]: https://github.com/hyprwm/hypridle
[Hyprlock]: https://github.com/hyprwm/hyprlock
[Hyprpaper]: https://github.com/hyprwm/hyprpaper
[Bibata-Modern-Ice]: https://github.com/ful1e5/Bibata_Cursor
[Loupe]: https://apps.gnome.org/Loupe/
[VLC]: https://www.videolan.org/vlc/
[vokoscreenNG]: https://github.com/vkohaupt/vokoscreenNG
[Spotify]: https://spotify.com
[LibreOffice]: https://www.libreoffice.org/

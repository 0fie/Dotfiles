{ pkgs, ... }:

{
  home.packages = with pkgs; [ pyprland ];

  # TODO: Make use of
  xdg.configFile."hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = [
      "toggle_special",
      "scratchpads",
    ]

    [workspaces_follow_focus]
    max_workspaces = 9

    [expose]
    include_special = false

    [scratchpads.term]
    animation = "fromTop"
    command = "kitty --class kitty-dropterm"
    class = "kitty-dropterm"
    size = "75% 60%"
    max_size = "1920px 100%"

    [scratchpads.volume]
    animation = "fromRight"
    command = "pavucontrol"
    class = "pavucontrol"
    lazy = true
    size = "40% 90%"
    max_size = "1080px 100%"
    unfocus = "hide"

    [layout_center]
    margin = 60
    offset = [0, 30]
    next = "movefocus r"
    prev = "movefocus l"
    next2 = "movefocus d"
    prev2 = "movefocus u"
  '';
}

{ pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    plugins = with pkgs.hyprlandPlugins; [
     # hyprbars
    # hyprwinwrap
    #  hyprexpo
    #  hy3
    inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];
      
    settings = {
      "$mainMod" = "SUPER";



      monitor = [ 
        # "eDP-1, disable"
         "eDP-1,1920x1080@60,0x0,1"
        # "DP-3,1920x1080@144.02,1920x0,1,mirror,eDP-1"
         "DP-3,1920x1080@144.02,1920x0,1"
        #   "DP-3,1920x1080@60,1920x0,1"
        #"DP-4,1920x1080@144.02,1920x0,1,mirror, eDP-1"
        # "DP-4,1920x1080@144.02,1920x0,1"
        #"DP-1,1920x1080@144.02,1920x0,1,mirror,eDP-1" 
        #"DP-1,1920x1080@144.02,1920x0,1"
        #"DP-2,1920x1080@144.02,1920x0,1,mirror,eDP-1"
        #"DP-2,1920x1080@144.02,1920x0,1"
        # "HDMI-A-1, 1920x1080@120.00,1920x0,1,mirror,eDP-1"
        # "HDMI-A-1, 1920x1080@120.00,1920x0,1"
        #   ",preferred,auto,1"

   ];
    

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,24"
        # "QT_QPA_PLATFORM,qt6ct"
        #"QT_STYLE_OVERRIDE,kvantum"
        "XDG_SCREENSHOTS_DIR,~/screens"
        "WLR_DRM_DEVICES.$HOME/.config/hypr/card"
        "WLR_DRM_DEVICES.$HOME/.config/hypr/integracard"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 1;

        #touchpad = {
        #  natural_scroll = false;
       # };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 3;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

        # no_cursor_warps = false;
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 16;
          passes = 2;
          new_optimizations = true;
        };

        # drop_shadow = true;
        # shadow_range = 4;
        # shadow_render_power = 3;
        # "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      master = {
       # new_is_master = true;
      };

      # gestures = {
      # workspace_swipe = true;
      # workspace_swipe_fingers = 3;
      # workspace_swipe_invert = false;
      # workspace_swipe_distance = 200;
      # workspace_swipe_forever = true;
      # };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        # render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };
      

      exec-once = [
        "swww-daemon &"
        "swww img ~/Pictures/1014191.jpg"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      bind = [
        "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"

        "$mainMod, Return, exec, ghostty"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, dolphin"
        "$mainMod, F, togglefloating,"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, G, exec, wofi --show drun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"

        # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, KP_End, workspace, 1"
        "$mainMod, KP_Down, workspace, 2"
        "$mainMod, KP_Next, workspace, 3"
        "$mainMod, KP_Left, workspace, 4"
        "$mainMod, KP_Begin, workspace, 5"
        "$mainMod, KP_Right, workspace, 6"
        "$mainMod, KP_Home, workspace, 7"
        "$mainMod, KP_Up, workspace, 8"
        "$mainMod, KP_Prior, workspace, 9"
        "$mainMod, KP_Insert, workspace, 10"
        "$mainMod, 1, workspace, 11"
        "$mainMod, 2, workspace, 12"
        "$mainMod, 3, workspace, 13"
        "$mainMod, 4, workspace, 14"
        "$mainMod, 5, workspace, 15"
        "$mainMod, 6, workspace, 16"
        "$mainMod, 7, workspace, 17"
        "$mainMod, 8, workspace, 18"
        "$mainMod, 9, workspace, 19"
        "$mainMod, 0, workspace, 20"

         # Set fullscreen mode
        "$mainMod SHIFT, F, fullscreen"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod CTRL, 1, movetoworkspacesilent, 1"
        "$mainMod CTRL, 2, movetoworkspacesilent, 2"
        "$mainMod CTRL, 3, movetoworkspacesilent, 3"
        "$mainMod CTRL, 4, movetoworkspacesilent, 4"
        "$mainMod CTRL, 5, movetoworkspacesilent, 5"
        "$mainMod CTRL, 6, movetoworkspacesilent, 6"
        "$mainMod CTRL, 7, movetoworkspacesilent, 7"
        "$mainMod CTRL, 8, movetoworkspacesilent, 8"
        "$mainMod CTRL, 9, movetoworkspacesilent, 9"
        "$mainMod CTRL, 0, movetoworkspacesilent, 10"
        "$mainMod SHIFT, 1, movetoworkspacesilent, 11"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 12"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 13"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 14"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 15"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 16"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 17"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 18"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 19"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 20"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Keyboard backlight
        "$mainMod, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
        "$mainMod, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

        # Volume and Media Control
        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -m"
        
        # Brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
        ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

        # Configuration files
        ''$mainMod SHIFT, N, exec, ghostty -e sh -c "rb"''
        ''$mainMod SHIFT, C, exec, ghostty -e sh -c "conf"''
        ''$mainMod SHIFT, H, exec, ghostty -e sh -c "nvim ~/nix/home-manager/modules/wms/hyprland.nix"''
        ''$mainMod SHIFT, W, exec, ghostty -e sh -c "nvim ~/nix/home-manager/modules/wms/waybar.nix"''
        '', Print, exec, grim -g "$(slurp)" - | swappy -f -''

        # Waybar
        "$mainMod, B, exec, pkill -SIGUSR1 waybar"
        "$mainMod, W, exec, pkill -SIGUSR2 waybar"

        # Disable all effects
        "$mainMod Shift, G, exec, ~/.config/hypr/gamemode.sh "
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}

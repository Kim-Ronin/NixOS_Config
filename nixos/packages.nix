{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  
  programs.wireshark.enable = true;
  programs.wireshark.package = pkgs.wireshark;

services.lsfg-vk = {
  enable = true;
  ui.enable = true; # installs gui for configuring lsfg-vk
};

      #OpenGl-unstable
   hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
     rocmPackages.clr.icd
   ];
  };


            #KDE



    #OpenRazer stuff
        hardware.openrazer.enable = true;

        #Steam stuff
   programs.steam.gamescopeSession.enable = true;

   programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    };

   programs.gamemode.enable = true;






  environment.systemPackages = with pkgs; [
    # Desktop apps
    audacity
    blender
    ghostty
    #  davinci-resolve-studio
    kdePackages.kate
    telegram-desktop
    rofi
    wofi
    kdePackages.kdenlive
    discord
    vulkan-tools
    gpu-viewer
    brave
    tor
    tor-browser
    goverlay
    gimp
    tshark
    libreoffice
    proton-pass
    steamcmd
    unzip
    koreader
    mangohud
    protonup-ng
    bottles
    lutris
    winetricks
    wineWowPackages.stable
    wineWowPackages.waylandFull
    lshw
    vlc
    xfce.xfce4-taskmanager
    p7zip
    hwinfo
    vkbasalt
    vkbasalt-cli
    wireplumber
    transmission_4
    transmission_4-qt 
    libvirt
    usbutils
    util-linux
    parted
    unrar_6
    dbus
    usbview
    radeontop
    protonup-qt
    r2modman
    lsfg-vk
    lsfg-vk-ui
    kdePackages.qt6ct
    hyprland-qt-support
    protonplus
    libva-utils


    #RazerStuff
     razergenie
     openrazer-daemon
     polychromatic


    #GPD related
    handheld-daemon



     #Emulatioan
    ryubing


    # Coding stuff
    gnumake
    gcc

    # CLI utils
    file
    tree
    wget
    git
    gitFull
    fastfetch
    htop
    nix-index
    unzip
    scrot
    ffmpeg
    light
    lux
    mediainfo
    ranger
    zip
    ntfs3g
    yt-dlp
    brightnessctl
    swww



    # Network stuff
    openssl
    bluez
    bluez-tools
    bluetui
    rofi-bluetooth




    # GUI utils
    feh
    imv
    dmenu
    screenkey
    mako
     gromit-mpx


    # Wayland stuff
    wl-clipboard
    cliphist
    hyprpaper
    hyprcursor
    seatd
    xdg-desktop-portal-hyprland
    polybar
    waybar
    hyprutils
    wayland-utils

    # Sound
    pipewire
    pulseaudio
    pamixer
    pwvucontrol
    pw-volume
    obs-studio-plugins.obs-pipewire-audio-capture
    qjackctl
    qpwgraph

    # GPU stuff
     driversi686Linux.mesa

    # Screenshotting
    grim
    grimblast
    slurp
    flameshot
    swappy


    #KDE
    


    # Other
    home-manager
    papirus-nord
    kdePackages.plasma-keyboard

    #sddm theme
    (sddm-astronaut.override {
    embeddedTheme = "japanese_aesthetic";
  })


    #########
  ];
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    source-han-sans
    source-han-serif
    # (import ./fonts/electroharmonics { inherit pkgs; })

  ];
  #  fonts.enableFontDir = true;

}


{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.kim = {
      isNormalUser = true;
      description = "kim";
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" "gamemode" "openrazer" "wireshark" ];
      packages = with pkgs; [];
    };
  };

  # Enable automatic login for the user.
  #services.getty.autologinUser = "kim";
}

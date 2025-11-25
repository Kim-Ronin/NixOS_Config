{ config, pkgs, ... }:

{
services.displayManager.sddm = {
      enable = true;
      theme = "sddm-astronaut-theme";
      extraPackages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.qtvirtualkeyboard
      kdePackages.qtmultimedia
    ];
  settings = {
      General = {
        InputMethod = "qtvirtualkeyboard";
      };
    };
};
}

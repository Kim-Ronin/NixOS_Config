{

  imports = [
      ./opts.nix
    #  ./keymaps.nix
     ./autocmds.nix
     ./plugins/plugins-bundle.nix
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    colorschemes.oxocarbon.enable = true;
    #colorschemes.everforest.enable = true;
    #colorschemes.one.enable = true;
    #colorschemes.onedark.enable = true;
    #colorschemes.palette.enable = true;
    #colorschemes.poimandres.enable = true;
    #colorschemes.rose-pine.enable = true;
    #colorschemes.vscode.enable = true;

    #colorschemes.ayu.enable = true;
    #colorschemes.catppuccin.enable = true;
    #colorschemes.cyberdream.enable = true;
    #colorschemes.dracula.enable = true;
    #colorschemes.gruvbox.enable = true;
    #colorschemes.kanagawa.enable = true;
    #colorschemes.melange.enable = true;
    #colorschemes.modus.enable = true;
    #colorschemes.nightfox.enable = true;
    #colorschemes.nord.enable = true;
    #colorschemes.tokyonight.enable = true;



    #colorschemes.neofusion.eable = true; # don't yet exist
  };

}

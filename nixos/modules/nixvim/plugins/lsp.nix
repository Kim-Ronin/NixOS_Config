{
  programs.nixvim.plugins = {

    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = true;
     # indent = true;
    };


   treesitter.settings.indent = {
              enable = true;
   };


    treesitter-refactor = {
      enable = true;
      settings.highlightDefinitions = {
        enable = true;
        clear_on_cursor_move = false;
        # Set to false if you have an `updatetime` of ~100.
      
      };
    };

    hmts.enable = true;

     lspkind = {
       enable = true;
    
       settings.cmp = {
         enable = true;
         menu = {
           nvim_lsp = "[LSP]";
           nvim_lua = "[api]";
           path = "[path]";
           luasnip = "[snip]";
           buffer = "[buffer]";
           neorg = "[neorg]";
           cmp_tabby = "[Tabby]";
         };
       };
     };

    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
      };
    };
  };
}

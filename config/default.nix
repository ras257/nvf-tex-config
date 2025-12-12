{ pkgs, ... }:
{
  imports = [
    ./vimtex.nix
    ./luasnip.nix
    ./spell.nix
  ];
  vim = {
    additionalRuntimePaths = [
      ../lua
    ];

    # Add everything in the vim runtime path into lua's package.path
    luaConfigPre = ''
      local rtp = vim.api.nvim_list_runtime_paths()
      for _, path in ipairs(rtp) do
        local lua_path = path .. "/?.lua"
        local init_path = path .. "/?/init.lua"
        if not string.find(package.path, lua_path, 1, true) then
          package.path = package.path .. ";" .. lua_path .. ";" .. init_path
        end
      end
    '';

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    options = {
      autoindent = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      linebreak = true;
      breakindent = true;
      tm = 500;
    };

    enableLuaLoader = true;
    theme = {
      enable = true;
      name = "catppuccin";
      style = "frappe";
    };

    lsp.enable = true;

    languages = {
      enableTreesitter = true;
      nix.enable = true;
      lua.enable = true;
    };

    lazy.plugins = {
      "texpresso.vim" = {
        package = pkgs.vimPlugins.texpresso-vim;
      };

      "whitespace.nvim" = {
        package = pkgs.vimPlugins.whitespace-nvim;
      };
    };

    statusline.lualine.enable = true;
    telescope.enable = true;

    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
    };

    keymaps = [
      {
        key = "<c-p>";
        mode = [
          "n"
          "v"
        ];
        action = "\"+";
      }
      {
        key = "<Leader>tr";
        mode = [
          "n"
        ];
        lua = true;
        action = "require('whitespace-nvim').trim";
      }
    ];

    autocmds = [
      {
        command = "set timeoutlen=50";
        event = [ "InsertEnter" ];
      }
      {
        command = "set timeoutlen=500";
        event = [ "InsertLeave" ];
      }
    ];
  };
}

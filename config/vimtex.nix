{ pkgs, ... }:
{
  vim = {
    lazy.plugins.vimtex = {
      package = pkgs.vimPlugins.vimtex;
      after = "vim.api.nvim_command('call vimtex#init()')";
    };

    globals = {
      tex_flavor = "latex";

      vimtex_view_method = "zathura";
      vimtex_format_enabled = true;
      vimtex_indent_on_ampersands = true;
      vimtex_imaps_enabled = false;
      vimtex_subfile_start_local = true;
      vimtex_callback_progpath = "nvim";

      vimtex_compiler_latexmk = {
        aux_dir = ".build";
        out_dir = "output";
        callback = 1;
        continous = 1;
      };

      vimtex_quickfix_ignore_filters = [
        "Package lipsum Warning"
        # Double escape needed here
        "Overfull \\\\hbox"
        "Underfull \\\\hbox"
        "Overfull \\\\vbox"
        "Underfull \\\\vbox"
        "LaTeX Warning: Reference"
        "LaTeX Warning: There were undefined references."
      ];

      vimtex_env_toggle_math_map = {
        "$" = "\\[";
        "\\[" = "align";
        "align" = "equation";
      };
    };

    keymaps = [
      {
        key = "<leader>tt";
        mode = "n";
        action = "<cmd>TeXpresso %<CR>";
      }
      # Swap the $ mappings to m and then set the old m mappings to i
      {
        key = "ai";
        mode = [
          "x"
          "o"
        ];
        action = "<Plug>(vimtex-am)";
      }
      {
        key = "ii";
        mode = [
          "x"
          "o"
        ];
        action = "<Plug>(vimtex-im)";
      }
      {
        key = "am";
        mode = [
          "x"
          "o"
        ];
        action = "<Plug>(vimtex-a$)";
      }
      {
        key = "im";
        mode = [
          "x"
          "o"
        ];
        action = "<Plug>(vimtex-i$)";
      }
      # Remap default **$ mappings to **m
      {
        key = "dsm";
        mode = "n";
        action = "<Plug>(vimtex-env-delete-math)";
      }
      {
        key = "csm";
        mode = "n";
        action = "<Plug>(vimtex-env-change-math)";
      }
      {
        key = "tsm";
        mode = "n";
        action = "<Plug>(vimtex-env-toggle-math)";
      }
    ];
  };
}

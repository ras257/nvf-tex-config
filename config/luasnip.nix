{ ... }:
let
  makeFallbackBind =
    {
      key,
      mode,
      condition,
      action,
    }:
    {
      inherit key mode;
      silent = true;
      lua = true;
      action = ''
        function()
          if ${condition} then
            ${action}
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("${key}", true, false, true), "n", false)
          end
        end
      '';
    };
in
{
  vim = {
    lazy.plugins.luasnip.event = "BufEnter";
    snippets.luasnip = {
      enable = true;
      loaders = "require('luasnip.loaders.from_lua').load()";
      providers = [ ];
      setupOpts = {
        enable_autosnippets = true;
        # Required for repeat nodes to update in sync with their corresponding insert node
        update_events = "TextChanged,TextChangedI";
        store_selection_keys = "<Tab>";
      };
    };

    keymaps = [
      (makeFallbackBind {
        key = "<Tab>";
        mode = "i";
        condition = "require('luasnip').expand()";
        action = "require('luasnip').expand()";
      })
      (makeFallbackBind {
        key = "jk";
        mode = [
          "i"
          "s"
        ];
        condition = "require('luasnip').jumpable(1)";
        action = "require('luasnip').jump(1)";
      })
      (makeFallbackBind {
        key = "kj";
        mode = [
          "i"
          "s"
        ];
        condition = "require('luasnip').jumpable(1)";
        action = "require('luasnip').jump(1)";
      })
      (makeFallbackBind {
        key = "JK";
        mode = [
          "i"
          "s"
        ];
        condition = "require('luasnip').jumpable(-1)";
        action = "require('luasnip').jump(-1)";
      })
      (makeFallbackBind {
        key = "KJ";
        mode = [
          "i"
          "s"
        ];
        condition = "require('luasnip').jumpable(-1)";
        action = "require('luasnip').jump(-1)";
      })
      (makeFallbackBind {
        key = "<C-f>";
        mode = [
          "i"
          "s"
        ];
        condition = "require('luasnip').choice_active()";
        action = "require('luasnip').change_choice(1)";
      })
      # Map A to enter insert mode at the end of selection in select mode
      {
        key = "A";
        mode = "s";
        action = "<Esc>`>a";
      }
      # Map I to enter insert mode at the start of selection in select mode
      {
        key = "I";
        mode = "s";
        action = "<Esc>`<i";
      }
    ];
  };
}

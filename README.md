# NVF TeX Config
This is my personal neovim config I exclusively use for typsetting LaTeX. It is configured using the nix language using [NVF](https://github.com/NotAShelf/nvf).

It uses the VimTeX plugin and LuaSnip for snippets.

To give it a try run:
```
nix run github:ras257/nvf-tex-config
```
on a system with nix.
## Structure
The NVF configuration is in [config](https://github.com/ras257/nvf-tex-config/tree/master/config) and snippets are in [lua](https://github.com/ras257/nvf-tex-config/tree/master/lua).

## Acknowledgements
- [Gilles Castel](https://castel.dev/): Amazing guides on [live typsetting lecture notes](https://castel.dev/post/lecture-notes-1/) that inspired me to create this config.
- [ejmastnak](https://ejmastnak.com/): Created the incredibly useful ["A guide to supercharged mathematical typesetting"](https://ejmastnak.com/tutorials/vim-latex/intro/) which taught me how to use VimTex and LuaSnip.
- [Sussman Lab](https://www.dmsussman.org/resources/): For their [TeXpresso guide](https://www.dmsussman.org/resources/texpresso/).
- [evesdropper.dev](https://evesdropper.dev): For [their guide](https://evesdropper.dev/files/luasnip/choice-dynamic/#example-1-matrix-snippets---regex-dynamic-snippets) on LuaSnip's choice and dynamic nodes.

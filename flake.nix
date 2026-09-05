{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      overlays = [
        # (_final: prev: {
        #   vimPlugins = prev.vimPlugins // {
        #     texpresso-vim = prev.vimPlugins.texpresso-vim.overrideAttrs (_old: {
        #       src = prev.fetchFromGitHub {
        #         owner = "ras257";
        #         repo = "texpresso.vim";
        #         rev = "cae07f5fc8b73d302a1b040ea4c7c47a6144bf07";
        #         hash = "sha256-WJbvPS9DrgwGLTnsFoCFhU0DrZOMUUtj9gCfQaNDYHo=";
        #       };
        #     });
        #   };
        # })
      ];
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system overlays; };
      texlive = pkgs.texlive;
      texlive-custom = (
        texlive.combine {
          inherit (texlive)
            scheme-basic
            latexmk
            ;
        }
      );
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-tree;
      packages.${system}.default =
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [ ./config ];
        }).neovim;
      devShells.${system}.default = pkgs.mkShell {
        name = "nvf-tex testing";
        packages = [
          texlive-custom
          self.packages.${system}.default
        ];
      };
    };
}

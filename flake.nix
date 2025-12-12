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
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
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
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
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

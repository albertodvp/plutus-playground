{
  description = "Plutus Playground";
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    haskellNix.url = "github:input-output-hk/haskell.nix";
    nixpkgs.follows = "haskellNix/nixpkgs-unstable";
    CHaP = {
      url = "github:intersectmbo/cardano-haskell-packages?ref=repo";
      flake = false;
    };
    iohk-nix.url = "github:input-output-hk/iohk-nix";
  };
  outputs = inputs@{ nixpkgs, haskellNix, flake-parts, CHaP, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { self', system, lib, config, pkgs, ... }:
        let
          overlays = [
            haskellNix.overlay
            (final: prev: {
              plutus-playground = final.haskell-nix.cabalProject' {
                compiler-nix-name = "ghc96";
                src = ./.;
                shell = {
                  withHoogle = false;
                  tools = {
                    cabal = "latest";
                    hlint = "latest";
                    haskell-language-server = "latest";
                  };
                };
                inputMap = { "https://chap.intersectmbo.org/" = CHaP; };
              };
            })
          ];
          pkgs = import nixpkgs { inherit system overlays; inherit (haskellNix) config; };
          flake = pkgs.plutus-playground.flake { };
        in
        {
          packages.default = flake.packages."plutus-playground:exe:plutus-playground";
        };
    };
}


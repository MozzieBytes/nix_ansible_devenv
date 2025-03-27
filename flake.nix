{
  description = "Demo nix dev-container";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      treefmt-nix,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
        treefmtPrograms = builtins.attrValues treefmtEval.config.build.programs;
      in
      {
        formatter = treefmtEval.config.build.wrapper;
        checks.formatting = treefmtEval.config.build.check self;
        devShells.default = pkgs.mkShell {
          buildInputs =
            with pkgs;
            [
              git
              nil
              ansible
              ansible-lint
              openssh
              python3
              python3Packages.jmespath
              cowsay
            ]
            ++ treefmtPrograms;
        };
      }
    );
}

{
  description = "gatsby netlify-cms development environment";

  nixConfig.bash-prompt-suffix = "[nix] \\e\[38;5;172mλ \\e\[m";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        config = {};
        overlays = [];
        pkgs = import nixpkgs { inherit config overlays system; };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            deno
            netlify-cli
            nodejs
            nodePackages.gatsby-cli
            python310
            python310Packages.grip
            yarn
          ];
        };
      }
    );
}

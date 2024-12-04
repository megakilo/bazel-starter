{
  description = "bazel-starter";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        {
          devShells.default =
            pkgs.mkShell {
              packages = [
                pkgs.bazel
              ];

              shellHook = ''
                export PS1='[\[\033[1;32m\]bazel-starter\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]]\$ '
              '';
            };
        }
      );
}

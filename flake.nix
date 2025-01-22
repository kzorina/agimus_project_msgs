{
  description = "ROS messages of the agimus-project.";

  inputs.nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";

  outputs =
    { nix-ros-overlay, self, ... }:
    nix-ros-overlay.inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nix-ros-overlay.inputs.nixpkgs {
          inherit system;
          overlays = [ nix-ros-overlay.overlays.default ];
        };
      in
      {
        packages = {
          default = self.packages.${system}.agimus-msgs-py;
          agimus-msgs = pkgs.callPackage ./default.nix { };
          agimus-msgs-py =
            pkgs.python3Packages.toPythonModule
              self.packages.${system}.agimus-msgs;
        };
      }
    );
}

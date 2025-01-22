{
  lib,
  stdenv,
  cmake,
  eigen,
  python3Packages,
  rosPackages,
}:
stdenv.mkDerivation {
  pname = "agimus-msgs";
  version = "0.0.2";

  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.unions [
      ./CMakeLists.txt
      ./msg
      ./package.xml
    ];
  };

  nativeBuildInputs = [
    cmake
    eigen
    python3Packages.python
    rosPackages.humble.ament-cmake
    rosPackages.humble.rosidl-default-generators
  ];

  propagatedBuildInputs = [
    rosPackages.humble.rosidl-typesupport-c
    rosPackages.humble.rosidl-typesupport-introspection-c
    rosPackages.humble.rosidl-runtime-py
    rosPackages.humble.sensor-msgs
    rosPackages.humble.std-msgs
  ];

  doCheck = true;

  meta = {
    description = "ROS messages of the agimus-project.";
    homepage = "https://github.com/agimus-project/agimus-msgs";
    license = lib.licenses.bsd2;
    maintainers = [ lib.maintainers.nim65s ];
    platforms = lib.platforms.linux;
  };
}

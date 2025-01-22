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
    # rosPackages.humble.ament-cmake-cppcheck
    # rosPackages.humble.ament-cmake-cpplint
    # rosPackages.humble.ament-cmake-flake8
    # rosPackages.humble.ament-cmake-pep257
    # rosPackages.humble.ament-cmake-uncrustify
    rosPackages.humble.rosidl-default-generators
  ];

  propagatedBuildInputs = [
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
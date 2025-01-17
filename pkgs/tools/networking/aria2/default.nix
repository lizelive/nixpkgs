{ lib, stdenv, fetchFromGitHub, fetchpatch, pkg-config, autoreconfHook
, gnutls, c-ares, libxml2, sqlite, zlib, libssh2
, cppunit, sphinx
, Security
}:

stdenv.mkDerivation rec {
  pname = "aria2";
  version = "1.37.0";

  src = fetchFromGitHub {
    owner = "aria2";
    repo = "aria2";
    rev = "release-${version}";
    sha256 = "sha256-xbiNSg/Z+CA0x0DQfMNsWdA+TATyX6dCeW2Nf3L3Kfs=";
  };

  patches = [
    # Fixes build errors clang 16 because `std::unary_function` and `std::binary_function`
    # were removed in C++17, which is the default with clang 16.
    (fetchpatch {
      url = "https://github.com/aria2/aria2/commit/8956c58d126a4e57e114f69ba6a5961724b7a817.patch";
      hash = "sha256-bwcR0YHlkxUdz1AKHq1m2bYI9vDVMv4x3WPsR8QEHtk=";
    })
  ];

  strictDeps = true;
  nativeBuildInputs = [ pkg-config autoreconfHook sphinx ];

  buildInputs = [ gnutls c-ares libxml2 sqlite zlib libssh2 ] ++
    lib.optional stdenv.isDarwin Security;

  outputs = [ "bin" "dev" "out" "doc" "man" ];

  configureFlags = [
    "--with-ca-bundle=/etc/ssl/certs/ca-certificates.crt"
    "--enable-libaria2"
    "--with-bashcompletiondir=${placeholder "bin"}/share/bash-completion/completions"
  ];

  prePatch = ''
    patchShebangs --build doc/manual-src/en/mkapiref.py
  '';

  nativeCheckInputs = [ cppunit ];
  doCheck = false; # needs the net

  enableParallelBuilding = true;

  meta = with lib; {
    homepage = "https://aria2.github.io";
    description = "A lightweight, multi-protocol, multi-source, command-line download utility";
    mainProgram = "aria2c";
    license = licenses.gpl2Plus;
    platforms = platforms.unix;
    maintainers = with maintainers; [ Br1ght0ne koral ];
  };
}

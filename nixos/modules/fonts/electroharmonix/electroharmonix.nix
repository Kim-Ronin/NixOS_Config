{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "electroharmonics-fonts";
  version = "1.0.0";
  src = ./;
  dontUnpack = true;
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/truetype
    cp *.ttf $out/share/fonts/truetype/
    runHook postInstall
  '';
  meta = {
    description = "Electroharmonics font family";
    license = pkgs.lib.licenses.unfree;
    maintainers = with pkgs.lib.maintainers; [ ];
  };
}

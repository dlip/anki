{ pkgs ? import <nixpkgs> { } }:
let
  # Patch the protoc alias so that it always builds from source.
  rulesPython = pkgs.fetchFromGitHub {
    owner = "bazelbuild";
    repo = "rules_python";
    rev = "431caaca056db4cc00d85982a2a7fab1e8854ef1";
    sha256 = "lOBmm6scqmWtupyJ/TfxwqX47EbhRniYLNXxKBGEpr0=";
    # extraPostFetch = ''
    #   sed -i 's|name = "protoc"|name = "_protoc_original"|' $out/proto/private/BUILD.release
    #   cat <<EOF >>$out/proto/private/BUILD.release
    #   alias(name = "protoc", actual = "@com_github_protocolbuffers_protobuf//:protoc", visibility = ["//visibility:public"])
    #   EOF
    # '';
  };

  # Patch the protoc alias so that it always builds from source.
  rulesProto = pkgs.fetchFromGitHub {
    owner = "bazelbuild";
    repo = "rules_proto";
    rev = "f7a30f6f80006b591fa7c437fe5a951eb10bcbcf";
    sha256 = "10bcw0ir0skk7h33lmqm38n9w4nfs24mwajnngkbs6jb5wsvkqv8";
    extraPostFetch = ''
      sed -i 's|name = "protoc"|name = "_protoc_original"|' $out/proto/private/BUILD.release
      cat <<EOF >>$out/proto/private/BUILD.release
      alias(name = "protoc", actual = "@com_github_protocolbuffers_protobuf//:protoc", visibility = ["//visibility:public"])
      EOF
    '';
  };
  myPython = pkgs.python3.withPackages (pkgs: with pkgs; [ pip pyqt5 pyliblo pyxdg ]);
in
with pkgs; (buildBazelPackage {
  name = "anki";
  bazel = bazel_4;
  src = ./.;

  shellHook = ''
    alias python='python3'
  '';

  PYO3_PYTHON = "${myPython}/bin/python3";

  nativeBuildInputs = [
    git # needed to fetch the bazel deps (protobuf in particular)
    myPython
    nodejs
    yarn
  ];

  bazelTarget = "//qt:runanki_qt515";

  fetchAttrs = {
    sha256 = "09dzxs2v5wpiaxrz7qj257q1fbx0gxwbk0jyx58n81m5kys7yj9k";
  };

  bazelFlags = [
    "--override_repository=rules_proto=${rulesProto}"
  ];

  buildAttrs = {
    preBuild = ''
      patchShebangs .
    '';
  };
})

{ pkgs, ... }: {
  packages = [
    pkgs.curl
    pkgs.unzip
  ];
  bootstrap = ''
    mkdir "$out"
    cp -rf ${./.}/* "$out"

    mkdir "$out/.idx"
    cp -rf ${./.}/.idx "$out"

    mkdir "$out/.vscode"
    cp -rf ${./.}/.vscode "$out"

    mkdir "$out/.github"
    cp -rf ${./.}/.github "$out"

    cp -rf ${./.}/.ci.yaml "$out"
    cp -rf ${./.}/.gitignore "$out"
    cp -rf ${./.}/.gitattributes "$out"

    rm "$out/idx-template.nix"
    rm "$out/idx-template.json"

    chmod -R u+w "$out"
  '';
}
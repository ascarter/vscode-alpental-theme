alias default := build

build:
    mkdir -p themes
    veneer build src themes

vsix: build
    npm run package

install: vsix
    VSIX=$(ls -t alpental-vscode-theme-*.vsix 2>/dev/null | head -n 1)
    [ -n "$VSIX" ] || { echo "No .vsix found in repo root (did packaging succeed?)"; exit 1; }
    code --install-extension "$VSIX"

clean:
    rm -rf themes ./*.vsix

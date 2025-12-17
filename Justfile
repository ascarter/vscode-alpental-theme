alias default := build

build:
    mkdir -p themes
    veneer build src themes

clean:
    rm -rf themes

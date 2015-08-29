#!/bin/bash

(   echo "digraph G {"
    go list -f '{{range .Imports}}{{printf "\t%q -> %q;\n" $.ImportPath .}}{{end}}' \
        $(go list -f '{{join .Deps " "}}' $1) $1
    echo "}"
) | dot -Tsvg -o deps.svg

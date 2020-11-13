#!/bin/bash

echo "\tsetting up"
mkdir -p "$HOME/.local/share/boethius"
cp -v opener_definitions "$HOME/.local/share/boethius"
cp -v opener "$HOME/.local/bin/opener" && \
chmod +x "$HOME/.local/bin/opener" && \
echo  "\tDone"
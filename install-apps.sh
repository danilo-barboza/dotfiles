#!/bin/bash

# exit immediately if something fails
set -o nounset
set -o errexit

if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

while read -r line; do
  [[ -z "$line" ]] && continue;
  echo "~> Running brew $line"
  brew $line || true
done <<< "$(grep -v '^$\|^\s*\#' Brewfile)"

exit 0
#!/bin/bash

echo "Installing BSD Games. This make take a while. Please be patient..."

sudo apt-get install -y bsdgames bsdgames-nonfree

# BSD Games icon
if test -f ~/.pocket-home/.version; then
  IS_ICON_PRESENT=`jq '.pages[0] | .items[] | select(.name == "BSD Games")' ~/.pocket-home/config.json`
  if [ -z ${IS_ICON_PRESENT} ]
  then
    jq '(.pages[0] | .items) |= . + [{ "name": "BSD Games", "icon": "~/PocketInstaller/Icons/bsdgames.png", "shell": "/home/chip/PocketInstaller/Launchers/bsdgames.sh" }]' ~/.pocket-home/config.json > tmp.$$.json
    mv tmp.$$.json ~/.pocket-home/config.json
  fi
fi

echo "BSD Games installed!"

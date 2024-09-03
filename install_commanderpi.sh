#!/bin/bash
# Install Commander Pi from https://github.com/Jack477/CommanderPi

# To fix not CommanderPi not openning run the following on command line:
# check this for pip installs https://pimylifeup.com/python-externally-managed-environment/
# sudo cp ~/.Xauthority ~root/

cd ~; git clone https://github.com/Jack477/CommanderPi
cd CommanderPi
sudo chmod +x install.sh
./install.sh
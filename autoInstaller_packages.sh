#!/bin/bash

print_style()  {
    local style="$1"
    local text_color="$2"
    local bg_color="$3"
    local text="$4"
    echo -e "${style}${text_color}${bg_color}\033[4m${text}\033[0m"
}

# Define styles
bold="\033[1m"
underline="\033[4m"
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
magenta="\033[35m"
cyan="\033[36m"
white="\033[37m"
reset="\033[0m"

# Example usage
# print_style "$bold" "This is bold text."
# print_style "$underline" "This is underlined text."
# print_style "$red" "This is red text."
# print_style "$green" "This is green text."
# print_style "$yellow" "This is yellow text."
# print_style "$blue" "This is blue text."
# print_style "$magenta" "This is magenta text."
# print_style "$cyan" "This is cyan text."
# print_style "$white" "This is white text."

print_style "$bold" "$white" "$red" "Updating and Upgrading machine."
# sudo apt-get update && sudo apt-get upgrade -y
echo " "

# List of packages to install
print_style "$bold" "$red" "$white" "Installing needed packages and apps."
packages=("code" "gnome-disk-utility" "baobab" "conky" "rpi-connect" "qbittorrent" "qbittorrent-nox")
spacing="  "

# Loop through each item
for package in "${packages[@]}"; do
    echo "- Processing $package:"

    if dpkg -l | grep -qw "$package"; then
        echo "$spacing* $package is installed"
    else
        echo "$spacing* $package is not installed, proceeding to install."
        sudo apt install $package -y
    fi
done
echo " "

print_style "$bold" "$green" "$green" "End of installations!!"
echo " "
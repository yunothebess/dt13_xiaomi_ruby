#!/bin/bash

# Set the device name.
device_name="ruby"

# Display a well-aligned kitty ASCII art at the start with paws.
echo -e "
  /\_____/\\
 /  o   o  \\
( ==  ^  == ) Meow, meow! Let's get started with kittyfying $device_name!
 )  (_)  (
/         \\
 \_______/
  |     |"

# Function to remove a directory if it exists and echo a message.
remove_directory() {
    if [ -d "$1" ]; then
        echo -e "🐱 Meow! Removing the old $1 directory..."
        rm -rf "$1"
        echo -e "🐱 Meow! $1 directory has been removed.\n"
    else
        echo -e "🐱 Meow! $1 directory does not exist. No need to remove.\n"
    fi
}

# Function to show a progress bar.
progress_bar() {
    local duration="$1"
    local progress="0"
    while [ $progress -lt 100 ]; do
        echo -ne "Progress: [$progress%]\r"
        sleep "$duration"
        ((progress += 10))
    done
    echo "Progress: [100%]"
}

# Remove the existing ./kernel/xiaomi/mt6877 directory.
remove_directory "./kernel/xiaomi/mt6877"

# Clone the android_kernel_xiaomi_ruby repository with depth=1 to ./kernel/xiaomi/mt6877.
git clone --depth 1 https://github.com/PQEnablers-Devices/android_kernel_xiaomi_mt6877 -b lineage-20 ./kernel/xiaomi/mt6877 &
echo -n "🐱 Meow! Cloning the android_kernel_xiaomi_ruby repository... "
progress_bar 5
wait
echo -e "🐱 Meow! Successfully cloned the new android_kernel_xiaomi_ruby repository for $device_name.\n"

# Remove the existing ./vendor/xiaomi/ruby directory.
remove_directory "./vendor/xiaomi/ruby"

# Clone the android_vendor_xiaomi_ruby repository with the 'dolby/lineage-20' branch to ./vendor/xiaomi/ruby.
git clone https://github.com/yunothebess/android_vendor_xiaomi_ruby -b lineage-20 ./vendor/xiaomi/ruby &
echo -n "🐱 Meow! Cloning the android_vendor_xiaomi_ruby repository... "
progress_bar 5
wait
echo -e "🐱 Meow! Successfully cloned the new android_vendor_xiaomi_ruby repository for $device_name.\n"

# Remove the existing ./device/mediatek/sepolicy_vndr directory.
remove_directory "./device/mediatek/sepolicy_vndr"

# Clone the android_device_mediatek_sepolicy_vndr repository to ./device/mediatek/sepolicy_vndr.
git clone https://github.com/PQEnablers-Devices/android_device_mediatek_sepolicy_vndr ./device/mediatek/sepolicy_vndr &
echo -n "🐱 Meow! Cloning the android_device_mediatek_sepolicy_vndr repository... "
progress_bar 5
wait
echo -e "🐱 Meow! Successfully cloned the new android_device_mediatek_sepolicy_vndr repository for $device_name.\n"

# Function to remove the "hardware/mediatek" directory if it exists.
remove_hardware_mediatek_directory() {
    if [ -d "./hardware/mediatek" ]; then
        echo -e "🐱 Meow! Removing the old hardware/mediatek directory..."
        rm -rf "./hardware/mediatek"
        echo -e "🐱 Meow! hardware/mediatek directory has been removed.\n"
    fi
}

# Remove the existing ./hardware/mediatek directory.
remove_hardware_mediatek_directory

# Clone the android_hardware_mediatek repository with the 'lineage-20-foss' branch to ./hardware/mediatek.
git clone https://github.com/PQEnablers-Devices/android_hardware_mediatek -b lineage-20-foss ./hardware/mediatek &
echo -n "🐱 Meow! Cloning the android_hardware_mediatek repository... "
progress_bar 5
wait
echo -e "🐱 Meow! Successfully cloned the new android_hardware_mediatek repository for $device_name.\n"

# Check if the ./hardware/xiaomi directory exists.
if [ ! -d "./hardware/xiaomi" ]; then
    # Clone the android_hardware_xiaomi repository with the 'lineage-20' branch to ./hardware/xiaomi only if it doesn't exist.
    git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-20 ./hardware/xiaomi &
    echo -n "🐱 Meow! Cloning the android_hardware_xiaomi repository... "
    progress_bar 5
    wait
    echo -e "🐱 Meow! Successfully cloned the android_hardware_xiaomi repository for $device_name.\n"
fi

# Display a kitty completion message.
echo "🐾 Meow! All repositories have been successfully cloned for $device_name's an-13 builds. Happy meowtifying! 🐾"

# Kitty reminder about removing vendorsetup.sh.
echo "🐱 Meow! Don't forget to remove vendorsetup.sh from the ./device/xiaomi/ruby folder. 🐱"

# Export ccache settings
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache

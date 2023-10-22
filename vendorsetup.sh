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
    local directory="$1"
    if [ -d "$directory" ]; then
        echo -e "🐱 Meow! Removing the old $directory directory..."
        rm -rf "$directory"
        echo -e "🐱 Meow! $directory directory has been removed.\n"
    else
        echo -e "🐱 Meow! $directory directory does not exist. No need to remove.\n"
    fi
}

# Function to clone a Git repository with error handling.
clone_repository() {
    local url="$1"
    local branch="$2"
    local directory="$3"
    
    if [ -d "$directory" ]; then
        echo -e "🐱 Meow! Skipping cloning as $directory already exists.\n"
    else
        echo -n "🐱 Meow! Cloning $url... "
        if git clone --depth 1 "$url" -b "$branch" "$directory" &> /dev/null; then
            echo -e "🐱 Meow! Successfully cloned $url for $device_name.\n"
        else
            echo -e "🐱 Meow! Cloning $url for $device_name failed.\n"
        fi
    fi
}

# Remove the existing directories.
remove_directory "./kernel/xiaomi/mt6877"
remove_directory "./vendor/xiaomi/ruby"
remove_directory "./device/mediatek/sepolicy_vndr"
remove_directory "./hardware/mediatek"
remove_directory "vendor/xiaomi/camera"  # Add this line to remove vendor/xiaomi/camera

# Parallel cloning of repositories.
clone_repository "https://github.com/PQEnablers-Devices/android_kernel_xiaomi_mt6877" "lineage-20" "./kernel/xiaomi/mt6877"
clone_repository "https://github.com/yunothebess/android_vendor_xiaomi_ruby" "miui_cam" "./vendor/xiaomi/ruby"
clone_repository "https://github.com/PQEnablers-Devices/android_device_mediatek_sepolicy_vndr" "master" "./device/mediatek/sepolicy_vndr"
clone_repository "https://github.com/PQEnablers-Devices/android_hardware_mediatek" "lineage-20-foss" "./hardware/mediatek"
clone_repository "https://github.com/LineageOS/android_hardware_xiaomi" "lineage-20" "./hardware/xiaomi"

# Add this section to clone vendor/xiaomi/camera with the "ruby" branch
remove_directory "vendor/xiaomi/camera"
clone_repository "https://gitlab.com/wodanesdag/vendor_xiaomi_camera.git" "ruby" "vendor/xiaomi/camera"

# Display a kitty completion message.
echo "🐾 Meow! All repositories have been successfully cloned for $device_name's an-13 builds. Happy meowtifying! 🐾"

# Kitty reminder about removing vendorsetup.sh.
echo "🐱 Meow! Don't forget to remove vendorsetup.sh from the ./device/xiaomi/ruby folder. 🐱"

# Export ccache settings
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache

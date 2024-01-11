#!/bin/bash

packages=(
    mesa
    lib32-mesa
    xf86-video-amdgpu
    xf86-video-ati
    libva-mesa-driver
    vulkan-radeon
    lib32-vulkan-radeon
)

paru -S "${packages[@]}"
cargo install amdgpu_top

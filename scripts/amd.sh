#!/bin/bash

packages=(
    mesa
    xf86-video-amdgpu
    xf86-video-ati
    libva-mesa-driver
    vulkan-radeon
)

paru -S "${packages[@]}"
cargo install amdgpu_top

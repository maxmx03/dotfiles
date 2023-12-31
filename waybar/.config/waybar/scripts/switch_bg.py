import os
import random
import subprocess

hyprland_folder = "/usr/share/hyprland"
home_dir = os.path.expanduser("~")
wallpaper_folder = os.path.join(home_dir, "Wallpapers")


def switch_wallpaper(path):
    cmd = f"swww img {path} --transition-fps 60 --transition-type wipe --transition-duration 3"
    subprocess.run(
        cmd,
        shell=True,
    )


def get_random_img_file(path: str) -> str:
    png_files = [
        file
        for file in os.listdir(path)
        if file.lower().endswith(".png")
        or file.lower().endswith(".jpg")
        or file.lower().endswith(".webp")
    ]

    if png_files:
        return os.path.join(path, random.choice(png_files))
    else:
        return ""


basename = os.path.basename
result = subprocess.run("swww query", shell=True, capture_output=True, text=True)
actual_wallpaper = basename(result.stdout).replace("\n", "")

changed_wallpaper = False

while not changed_wallpaper:
    new_wallpaper = get_random_img_file(path=wallpaper_folder)

    if actual_wallpaper != basename(new_wallpaper):
        switch_wallpaper(path=new_wallpaper)
        changed_wallpaper = True
    else:
        hyprland_wallpaper = get_random_img_file(path=hyprland_folder)
        switch_wallpaper(path=hyprland_wallpaper)
        changed_wallpaper = True

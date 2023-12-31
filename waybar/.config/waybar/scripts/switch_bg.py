import subprocess
import re
import os


def is_type(value, is_type):
    return type(value) == is_type or isinstance(value, is_type)


basename = os.path.basename
result = subprocess.run("swww query", shell=True, capture_output=True, text=True)
actual_wallpaper = re.findall(r"(\/.*?\.[\w:]+)", result.stdout)

changed_wallpaper = False

while not changed_wallpaper:
    new_wallpaper = subprocess.run(
        "find ~/Wallpapers/ -type f | shuf --random-source=/dev/urandom -n 1",
        shell=True,
        capture_output=True,
        text=True,
    ).stdout.replace("\n", "")

    if is_type(value=actual_wallpaper, is_type=list):
        if basename(actual_wallpaper[0]) != basename(new_wallpaper):
            subprocess.run(
                f"swww img '{new_wallpaper}' --transition-fps 60 --transition-type wipe --transition-duration 3",
                shell=True,
            )
            changed_wallpaper = True
        else:
            subprocess.run(
                "swww img /usr/share/hyprland/wall_anime_2K.png",
                shell=True,
            )
            break
    else:
        subprocess.run(
            "swww img /usr/share/hyprland/wall_anime_2K.png",
            shell=True,
        )
        break

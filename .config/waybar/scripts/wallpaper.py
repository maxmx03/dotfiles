import os
import random
import subprocess

HOMEDIR = os.path.expanduser("~")
WALLPAPER_FOLDER = os.path.join(HOMEDIR, ".wallpapers")


def switch_wallpaper(path):
    cmd = f"swww img {path} --transition-fps 60 --transition-type wipe --transition-duration 3"
    subprocess.run(
        cmd,
        shell=True,
    )


def get_random_img_file(path: str) -> str:
    img = [
        file
        for file in os.listdir(path)
        if file.lower().endswith(".png")
        or file.lower().endswith(".jpg")
        or file.lower().endswith(".webp")
        or file.lower().endswith(".jpeg")
        or file.lower().endswith(".gif")
    ]

    if img:
        return os.path.join(path, random.choice(img))
    else:
        return ""


def main():
    query = subprocess.run("swww query", shell=True, capture_output=True, text=True)
    current_wallpaper = os.path.basename(query.stdout).replace("\n", "")
    new_wallpaper = get_random_img_file(path=WALLPAPER_FOLDER)

    if current_wallpaper != os.path.basename(new_wallpaper):
        switch_wallpaper(path=new_wallpaper)
    else:
        if len(os.listdir(WALLPAPER_FOLDER)) > 1:
            main()


main()

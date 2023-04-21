import os
import curses
import shutil
import subprocess


def draw_table(stdscr, options):
    # Clear the screen
    stdscr.clear()

    # Calculate the maximum width of the table
    max_width = max(len(option) for option in options)

    # Calculate the center of the screen
    screen_height, screen_width = stdscr.getmaxyx()
    x = screen_width // 2 - max_width // 2

    # Draw the header message
    header = "Select the option to update the corresponding configuration:"
    header_x = screen_width // 2 - len(header) // 2
    stdscr.addstr(0, header_x, header)

    # Draw the table
    for i, option in enumerate(options):
        y = 2 + i
        stdscr.addstr(y, x, option)

    # Draw the cursor on the first option
    cursor_y = 2
    stdscr.move(cursor_y, x)
    stdscr.refresh()

    # Wait for user input
    while True:
        key = stdscr.getch()

        if key == curses.KEY_UP:
            # Move the cursor up
            if cursor_y > 2:
                cursor_y -= 1
                stdscr.move(cursor_y, x)
                stdscr.refresh()
        elif key == curses.KEY_DOWN:
            # Move the cursor down
            if cursor_y < len(options) + 1:
                cursor_y += 1
                stdscr.move(cursor_y, x)
                stdscr.refresh()
        elif key == ord("\n"):
            # User has made a selection
            selection = options[cursor_y - 2]
            return selection
        else:
            break


def main(stdscr):
    options = ["tmux", "kitty", "fish", "hyprland", "eww"]

    config_paths = {
        "tmux": os.path.expanduser("~/.tmux.conf"),
        "kitty": os.path.expanduser("~/.config/kitty"),
        "fish": os.path.expanduser("~/.config/fish"),
        "hyprland": os.path.expanduser("~/.config/hypr"),
        "eww": os.path.expanduser("~/.config/eww"),
    }

    # Draw the table and get the user's selection
    user_selection = draw_table(stdscr=stdscr, options=options)

    # Get the directory path of the script
    script_dir = os.path.dirname(os.path.abspath(__file__))

    # Delete the old configuration file or directory, if it exists
    if user_selection == "tmux":
        # Construct the path to the file you want to delete
        file_path = os.path.join(script_dir, ".tmux.conf")

        if os.path.exists(file_path):
            os.remove(file_path)

    elif user_selection == "kitty":
        # Construct the path to the directory you want to delete
        dir_path = os.path.join(script_dir, ".config/kitty")

        if os.path.exists(dir_path):
            shutil.rmtree(dir_path)

    elif user_selection == "fish":
        # Construct the path to the directory you want to delete
        dir_path = os.path.join(script_dir, ".config/fish")

        if os.path.exists(dir_path):
            shutil.rmtree(dir_path)
    elif user_selection == "hyprland":
        # Construct the path to the directory you want to delete
        dir_path = os.path.join(script_dir, ".config/hyprland")

        if os.path.exists(dir_path):
            shutil.rmtree(dir_path)
    elif user_selection == "eww":
        # Construct the path to the directory you want to delete
        dir_path = os.path.join(script_dir, ".config/eww")

        if os.path.exists(dir_path):
            shutil.rmtree(dir_path)

    # Copy the new configuration file or directory
    if user_selection == "tmux":
        subprocess.run(["cp", "-r", config_paths[user_selection], script_dir])
    else:
        subprocess.run(
            ["cp", "-r", config_paths[user_selection], script_dir + "/.config"]
        )


curses.wrapper(main)

import subprocess
import json

cmus_remote = "cmus-remote -C \"format_print '%f %{lvolume}'\""
basename = "xargs -I {} basename {}"
cmd = f"{cmus_remote} | {basename}"


result = subprocess.run(cmd, shell=True, capture_output=True, text=True)

output = result.stdout.strip()
filename, _, volume = output.rpartition(" ")

max_chars = 25

if len(filename) > max_chars:
    filename = filename[: max_chars - 3] + "..."


if volume.isnumeric() and type(int(volume)) is int:
    json_data = {"text": f"{filename} {volume}% 󰕾"}
else:
    json_data = {"text": f"{filename} {volume}"}


print(json.dumps(json_data))

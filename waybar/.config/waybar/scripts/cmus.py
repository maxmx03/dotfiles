import subprocess
import json

cmus_remote = "cmus-remote -Q "
grep = "grep -oP '(?<=file ).*\\.mp3'"
sed = "sed 's|.*/||; s/([^)]*)//g'"
search = f"{cmus_remote} | {grep} | {sed}"

# Run the shell command and capture its output
result = subprocess.run(
    search,
    shell=True,
    capture_output=True,
    text=True
)

# Get the output and use it within a JSON structure
# Assuming the output needs trimming
max_chars = 25  # Define the maximum number of characters

if len(result.stdout.strip()) > max_chars:
    # Truncate and add ellipsis
    output = result.stdout.strip()[:max_chars - 3] + '...'
else:
    output = result.stdout.strip()
json_data = {
    "text": output  # Place the output into a JSON structure
}

# Convert the JSON to a string and print it
print(json.dumps(json_data))

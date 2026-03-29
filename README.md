put it aside with this : # Cryptography and Media Muxing Tools

This repository contains a collection of Python scripts for cryptographic operations (RSA key generation, AES CTR mode encryption) and a bash script for multiplexing video and audio files.

## Table of Contents

- [Media Muxing Tools]
- [Table of Contents](#table-of-contents)
- [Description](#description)
- [Features](#features)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [Steps](#steps)
- [Usage](#usage)
  - [MP4 Muxing Script](#mp4-muxing-script)

## Description

**Media Processing** — a safe, automated way to combine video-only `.mp4` files with audio-only `.m4a` (or similar) files into properly muxed MP4 containers using FFmpeg's stream copy mode (`-c copy`).

The muxing script is especially useful when you have separated video and audio streams (e.g., from screen recordings, downloads, or editing workflows) and want to merge them without re-encoding.
## Features

- Finds `.mp4` video files and matching audio files (`.m4a`, `.aac`, `.mp3`, `.opus`, `.mka`, `.mp4`)
- Creates a new file named `<basename>.mux.mp4`
- Uses **stream copy** (`-c copy`) → fast, no quality loss
- **Dryrun** mode (`--dryrun`) to preview actions without changes
- **Verbose** mode (`--verbose`) for detailed output
- **rencode** mode (`--rencode`) for rencoding the video with ffmpeg default rencoding if needed
- Safety checks:
  - Skips if output already exists
  - Only deletes originals if mux succeeds **and** output file has non-zero size
  - Keeps originals on any failure
- Handles filenames with spaces, special characters, etc.


## Installation

### Prerequisites

- **Bash** ≥ 4 (most Linux/macOS systems)
- **FFmpeg** with libavformat/libavcodec support (needed for muxing)
  - Ubuntu/Debian: `sudo apt update && sudo apt install ffmpeg`
  - macOS (Homebrew): `brew install ffmpeg`
  - Windows: use WSL or download from ffmpeg.org
- `getopt` command (usually pre-installed on Linux/macOS)

### Steps

```bash
# Clone the repository
git clone https://github.com/OmarMohamedElsheikh/practice/tree/bash 

# Navigate into the project directory
cd your-project



## Usage

### MP4 Muxing Script

To use the `mux.sh` script to merge `.mp4` video files with `.m4a` audio files, navigate to the directory containing your video and audio files and run the script, providing the directory as an argument:

```bash
./mux.sh /path/to/your/media/directory
```

**Important**:
-   It will create a new file named `video.mux.mp4`.
-   **It will remove the original `.mp4` and `.m4a` files upon successful muxing.**



# Video Renamer Script

A Bash script to rename video files in a specific order with zero-padded numbering, while preserving their original extensions. Designed to clean up filenames, remove IDs in brackets (`[ID]`), and organize videos consistently.

## Features

- Renames files based on a defined order.
- Zero-pads numbering for single-digit numbers (`01.`, `02.`, …).
- Removes `[ID]` from filenames.
- Preserves the original file extension (`.mp4`, `.mkv`, `.avi`, etc.).
- Accepts either:
  - A list of titles passed via `--order`
  - A file containing the ordered list via `--file`
- **Dry-run mode** to preview renames without making changes.

## Usage

### Using `--order` arguments

```bash
bash rename_videos.sh --order \
"Introduction to Human Behavioral Biology" \
"Behavioral Evolution" \
"Behavioral Evolution II"Using a file with --file
bash rename_videos.sh --file order.txt```

Where order.txt contains one title per line, in the desired order.

### Dry-Run Mode

Add the --dry-run flag to see the renames without executing them:

```bash rename_videos.sh --file order.txt --dry-run```

### Output example:

```mv -n "1 Introduction to Neuroscience I [5031rWXgdYo].mux.mp4" "01. Introduction to Neuroscience I.mux.mp4"
mv -n "1 Introduction to Neuroscience II [uqU9lmFztOU].mux.mp4" "02. Introduction to Neuroscience II.mux.mp4"```

No files are modified in dry-run mode. This is useful to verify the script before running it for real.

**Example**

Original filenames:

```1 Introduction to Neuroscience I [5031rWXgdYo].mux.mp4
1 Introduction to Neuroscience II [uqU9lmFztOU].mux.mp4
1 Behavioral Genetics I [e0WZx7lUOrY].mux.mp4```

After running the script with the proper order:

```01. Introduction to Neuroscience I.mux.mp4
02. Introduction to Neuroscience II.mux.mp4
03. Behavioral Genetics I.mux.mp4```

**Notes**

- Filenames are matched based on the title substring.
- If a file in the order list does not exist in the directory, it is skipped.
- The script is safe to run multiple times (mv -n prevents overwriting existing files).
### Requirements
- **Bash** (tested on GNU Bash 5+)
- Works on Linux and macOS (with minor modifications for nullglob support)


## Contact

omarmohammedomarali@gmail.com

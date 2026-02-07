# Cryptography and Media Muxing Tools

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

The script will prompt you to enter the message to be encrypted. It will then generate a random key and counter, and output the ciphertext.

### MP4 Muxing Script

To use the `mux.sh` script to merge `.mp4` video files with `.m4a` audio files, navigate to the directory containing your video and audio files and run the script, providing the directory as an argument:

```bash
./mux.sh /path/to/your/media/directory
```

**Important**:
-   It will create a new file named `video.mux.mp4`.
-   **It will remove the original `.mp4` and `.m4a` files upon successful muxing.**

## Contact

omarmohammedomarali@gmail.com

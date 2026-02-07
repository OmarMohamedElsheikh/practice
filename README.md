# Cryptography and Media Muxing Tools

This repository contains a collection of Python scripts for cryptographic operations (RSA key generation, AES CTR mode encryption) and a bash script for multiplexing video and audio files,that i did for practice.

## Table of Contents

- [Cryptography and Media Muxing Tools](#cryptography-and-media-muxing-tools)
- [Table of Contents](#table-of-contents)
- [Description](#description)
- [Features](#features)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [Steps](#steps)
- [Usage](#usage)
  - [MP4 Muxing Script](#mp4-muxing-script)
  - [RSA Key Generation](#rsa-key-generation)
  - [AES CTR Mode Encryption](#aes-ctr-mode-encryption)
- [Contact](#contact)

## Description

This project offers practical tools for two distinct purposes:
1.  **Cryptography**: Python scripts to generate RSA public and private key pairs and to perform AES encryption in Counter (CTR) mode. **Educational not practical use**

2.  **Media Processing** — a safe, automated way to combine video-only `.mp4` files with audio-only `.m4a` (or similar) files into properly muxed MP4 containers using FFmpeg's stream copy mode (`-c copy`).

The muxing script is especially useful when you have separated video and audio streams (e.g., from screen recordings, downloads, or editing workflows) and want to merge them without re-encoding.

## Features

-   **RSA Key Generation**: Generates a public and private RSA key pair using randomly chosen large prime numbers.
-   **AES CTR Mode Encryption**: Encrypts a given message using AES in CTR mode with a randomly generated key.
-   **MP4 Muxing**: Automates the process of merging `.mp4` video files with same-named `.m4a` audio files, creating a new `*.mux.mp4` file and removing the originals.

## Installation

### Prerequisites

-   **Python 3.x**: Required for `rsa.py` and `ctr.py`.
-   **`sympy` library**: Install using pip: `pip install sympy`.
-   **`ffmpeg`**: Required for `bash_task1.sh`. Ensure `ffmpeg` is installed and available in your system's PATH. On Ubuntu/Debian, you can install it via `sudo apt-get install ffmpeg`.

### Steps

```bash
# Clone the repository
git clone https://github.com/OmarMohamedElsheikh/practice.git 

# Navigate into the project directory
cd your-project

# Install Python dependencies
pip install sympy
```

## Usage


### MP4 Muxing Script

## Description

**Media Processing** — a safe, automated way to combine video-only `.mp4` files with audio-only `.m4a` (or similar) files into properly muxed MP4 containers using FFmpeg's stream copy mode (`-c copy`).

The muxing script is especially useful when you have separated video and audio streams (e.g., from screen recordings, downloads, or editing workflows) and want to merge them without re-encoding.
## Features

- Finds `.mp4` video files and matching audio files (`.m4a`, `.aac`, `.mp3`, `.opus`, `.mka`, `.mp4`)
- Creates a new file named `<basename>.mux.mp4`
- Uses **stream copy** (`-c copy`) → fast, no quality loss
- **Dry-run** mode (`--dry-run`) to preview actions without changes
- **Verbose** mode (`--verbose`) for detailed output
- Safety checks:
  - Skips if output already exists
  - Only deletes originals if mux succeeds **and** output file has non-zero size
  - Keeps originals on any failure
- Handles filenames with spaces, special characters, etc.

### Prerequisites

- **Bash** ≥ 4 (most Linux/macOS systems)
- **FFmpeg** with libavformat/libavcodec support (needed for muxing)
  - Ubuntu/Debian: `sudo apt update && sudo apt install ffmpeg`
  - macOS (Homebrew): `brew install ffmpeg`
  - Windows: use WSL or download from ffmpeg.org
- `getopt` command (usually pre-installed on Linux/macOS)


### RSA Key Generation

Demonstrates the mathematics of RSA key generation using small primes for learning purposes.

run the `rsa.py` script:

```bash
python rsa.py
```

This script will generate `pr1`, `pr2`, `n`, `phi`, `e`, `d`, `pubk` (public key), and `prik` (private key) internally. You would need to modify the script to print or save these keys if you wish to use them elsewhere.

Small primes and Python’s random module are intentionally used to keep the math inspectable.

### AES CTR Mode Encryption

Demonstrates a CTR-like XOR stream cipher to understand counter-based encryption concepts, run the `ctr.py` script:

```bash

python ctr.py
```

The script will prompt you to enter the message to be encrypted. It will then generate a random key and counter, and output the ciphertext.

## Contact

omarmohammedomarali@gmail.com

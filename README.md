# Cryptography and Media Management Tools

This repository contains a collection of Python scripts for cryptographic operations and Bash utilities for automated media processing. These tools were developed as practical exercises for learning and personal workflow optimization.

---

## Table of Contents
- [Description](#description)
- [Projects](#projects)
  - [Cryptography Tools (Python)](#cryptography-tools-python)
  - [Media Muxing Tool (Bash)](#media-muxing-tool-bash)
  - [Video Renamer Script (Bash)](#video-renamer-script-bash)
- [Installation](#installation)
- [Usage](#usage)
- [Contact](#contact)

---

## Description
This project offers practical tools across two distinct domains:
1.  **Cryptography**: Educational scripts focused on the mathematical foundations of RSA key generation and AES encryption in Counter (CTR) mode.
2.  **Media Processing**: Robust Bash scripts designed to automate the merging of audio/video streams and the systematic renaming of video files (e.g., YouTube playlists).

---

## Projects

### Cryptography Tools (Python)
* **RSA Key Generation**: Generates public and private key pairs using large prime numbers to demonstrate the underlying mathematics.
* **AES CTR Mode Encryption**: Implements a CTR-like XOR stream cipher to illustrate counter-based encryption concepts.

> [!WARNING]
> These cryptographic scripts are intended for **educational purposes only** and are not suitable for practical, production-level security.

### Media Muxing Tool (Bash)
An automated way to combine video-only `.mp4` files with matching audio files (`.m4a`, `.aac`, `.mp3`, etc.) into properly muxed MP4 containers.
* **Stream Copy Mode**: Uses `-c copy` via FFmpeg for high-speed merging without quality loss.
* **Safety Checks**: Skips existing files and only removes originals if the output is successfully generated and non-zero in size.
* **Key Flags**:
    * `--dry-run`: Preview actions without making changes.
    * `--rencode`: Re-encode video using FFmpeg defaults if necessary.

### Video Renamer Script (Bash)
Designed to clean up and organize video files, specifically those with YouTube-style metadata or messy naming conventions.
* **ID Removal**: Automatically strips `[ID]` tags from filenames.
* **Zero-Padding**: Renames files with consistent numbering (e.g., `01.`, `02.`).
* **Extension Preservation**: Maintains the original format (`.mp4`, `.mkv`, etc.) during the rename.

---

## Installation

### Prerequisites
* **Python 3.x**: Required for `rsa.py` and `ctr.py`.
* **SymPy**: Required for prime number generation.
* **FFmpeg**: Required for media muxing.
* **Bash 4+**: Standard on most modern Linux distributions.

### Steps
```bash
# Clone the repository (Bash tools branch)
git clone https://github.com/OmarMohamedElsheikh/practice/tree/bash 

# Navigate into the project directory
cd practice

# Install Python dependencies
pip install sympy
```

## Usage
### 1. Media Muxing

To merge media files in a specific directory:
```bash
./mux.sh /path/to/your/media/directory
```
Output: Creates a `<basename>.mux.mp4` file.

Note: Original files are removed upon successful completion.

### 2. Video Renamer

You can rename files by passing a list of titles directly or using a text file.

Using `--order`:
```bash
bash rename_videos.sh --order \
"Introduction to Human Behavioral Biology" \
"Behavioral Evolution"
```

Using `--file`:
```bash
bash rename_videos.sh --file order.txt
```

### 3. Cryptography Scripts

RSA Key Generation:
```bash
python rsa.py
```
Generates n, phi, e, d, and public/private keys internally.

AES CTR Mode:
```bash
python ctr.py
```
Prompts for a message and returns a ciphertext using a random key and counter.

## Contact

Omar Mohamed Elsheikh Email: omarmohammedomarali@gmail.com

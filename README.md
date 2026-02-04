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

2.  **Media Muxing**: A bash script designed to combine separate MP4 video files with their corresponding M4A audio files into a single MP4 container.

## Features

-   **MP4 Muxing**: Automates the process of merging `.mp4` video files with same-named `.m4a` audio files, creating a new `*.mux.mp4` file and removing the originals.

## Installation

### Prerequisites

-   **`ffmpeg`**: Required for `mux.sh`. Ensure `ffmpeg` is installed and available in your system's PATH. On Ubuntu/Debian, you can install it via `sudo apt-get install ffmpeg`.

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
-   The script looks for `.mp4` and `.m4a` files with the same base name (e.g., `video.mp4` and `video.m4a`).
-   It will create a new file named `video.mux.mp4`.
-   **It will remove the original `.mp4` and `.m4a` files upon successful muxing.**

## Contact

omarmohammedomarali@gmail.com

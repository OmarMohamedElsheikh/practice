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
  - [RSA Key Generation](#rsa-key-generation)
  - [AES CTR Mode Encryption](#aes-ctr-mode-encryption)
  - [MP4 Muxing Script](#mp4-muxing-script)
- [Contact](#contact)

## Description

This project offers practical tools for two distinct purposes:
1.  **Cryptography**: Python scripts to generate RSA public and private key pairs and to perform AES encryption in Counter (CTR) mode.
2.  **Media Muxing**: A bash script designed to combine separate MP4 video files with their corresponding M4A audio files into a single MP4 container.

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

### RSA Key Generation

To generate RSA public and private keys, run the `rsa.py` script:

```bash
python rsa.py
```

This script will generate `pr1`, `pr2`, `n`, `phi`, `e`, `d`, `pubk` (public key), and `prik` (private key) internally. You would need to modify the script to print or save these keys if you wish to use them elsewhere.

### AES CTR Mode Encryption

To encrypt a message using AES in CTR mode, run the `ctr.py` script:

```bash

python ctr.py
```

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

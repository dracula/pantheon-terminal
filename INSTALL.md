### [Pantheon Terminal](https://elementary.io)

#### Prerequisites

You'll need the `dconf` command to install the theme. If you're using elementary OS (or another Debian-based distro), you can install it by running:

    sudo apt install dconf-cli

#### Install

After cloning this repo, or downloading and extracting a ZIP archive of the code from GitHub, change into the project directory and run the install script.

    cd pantheon-terminal
    ./install.sh

The changes should take affect immediately in the terminal window.

##### Silent Installs

The install script supports a quiet option that suppresses all info messages and prompts.

    ./install.sh --quiet
    # OR
    ./install.sh -q

#### Uninstall

To uninstall the theme, just use the `--uninstall` flag. You can also use `--quiet` to uninstall without info messages or prompts.

    ./install.sh --uninstall
    # Shhhh...
    ./install.sh --uninstall --quiet

The changes should take affect immediately in the terminal window.

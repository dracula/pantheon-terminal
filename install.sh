#!/usr/bin/env bash

BE_QUIET=0
ROOT_DIR=$(dirname "$0")
COLOR_DIR="$ROOT_DIR/colors"
SCHEMA="/io/elementary/terminal/settings"

set_color_scheme() {
    dconf write "$SCHEMA/palette" "'$(cat "$COLOR_DIR"/palette)'"
    dconf write "$SCHEMA/foreground" "'$(cat "$COLOR_DIR"/foreground)'"
    dconf write "$SCHEMA/background" "'$(cat "$COLOR_DIR"/background)'"
    dconf write "$SCHEMA/prefer-dark-style" "true"
}

reset_color_scheme() {
    dconf reset "$SCHEMA/palette"
    dconf reset "$SCHEMA/foreground"
    dconf reset "$SCHEMA/background"
    dconf reset "$SCHEMA/prefer-dark-style"
}

usage() {
    printf -- "Usage: install.sh [-?hq] [--help] [--quiet] [--uninstall] \n\n"
    printf -- "Options\n"
    printf -- "  -?, -h, --help         Show this information.\n"
    printf -- "  -q, --quiet            Suppress messages and assume YES on all prompts.\n"
    printf -- "  --uninstall            Uninstalls the color scheme.\n\n"
}

install_confirm() {
    local confirmation

    printf -- "Pantheon Terminal does not support multiple profiles or more than one hard-\n"
    printf -- "coded color scheme.\n\n"
    printf -- "This install script will overwrite the default color palette for Pantheon\n"
    printf -- "Terminal.\n\n"
    printf -- "You may uninstall this color scheme at any time by executing this script\n"
    printf -- "with the --uninstall flag.\n\n"
    printf -- "Do you wish to proceed? (type YES to proceed): "

    read -r confirmation
    if [[ $(echo "$confirmation" | tr '[:lower:]' '[:upper:]') != YES ]]; then
        printf -- "ERROR: Confirmation failed -- ABORTING!\n"
        exit 1
    fi
}

uninstall_confirm() {
    local confirmation

    printf -- "You have chosen to uninstall this color scheme and restore the default\n"
    printf -- "palette in Pantheon Terminal.\n\n"
    printf -- "You may reinstall this color scheme at any time by executing this script\n"
    printf -- "again WITHOUT the --uninstall flag.\n\n"
    printf -- "We're sad to see you go!\n\n"
    printf -- "Do you wish to proceed? (type YES to proceed): "

    read -r confirmation
    if [[ $(echo "$confirmation" | tr '[:lower:]' '[:upper:]') != YES ]]; then
        printf -- "ERROR: Confirmation failed -- ABORTING!\n"
        exit 1
    fi
}

while [ $# -gt 0 ]; do
    case $1 in
    -h | --help | '-?')
        usage
        exit 0
        ;;
    --uninstall)
        [[ "$BE_QUIET" == '0' ]] && uninstall_confirm
        reset_color_scheme
        exit 0
        ;;
    -q | --quiet)
        BE_QUIET=1
        ;;
    esac
    shift
done

[[ "$BE_QUIET" == '0' ]] && install_confirm
set_color_scheme
exit 0
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
    printf -- "Usage goes here\n"
}

while [ $# -gt 0 ]; do
    case $1 in
    -h | --help | '-?')
        usage
        exit 0
        ;;
    --uninstall)
        reset_color_scheme
        exit 0
        ;;
    -q | --quiet)
        BE_QUIET=1
        ;;
    esac
    shift
done

set_color_scheme
exit 0
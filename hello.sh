#!/usr/bin/env zsh
#
# terminal-hello
# Displays a photo inline in your terminal on shell startup.
# Works in terminals that support the Kitty graphics protocol (e.g. Ghostty, Kitty, WezTerm).
# Falls back to ANSI/ASCII art in terminals that don't.
#
# Requires: chafa (https://hpjansson.org/chafa/)
#   macOS:  brew install chafa
#   Linux:  sudo apt install chafa
 
# Path to the image to display. Override by exporting TERMINAL_HELLO_IMG
# in your shell config before this script runs, e.g.:
#   export TERMINAL_HELLO_IMG="$HOME/.config/terminal-hello/photo.jpg"
IMG="${TERMINAL_HELLO_IMG:-$HOME/.config/terminal-hello/photo.jpg}"
 
# Size of the rendered image (columns x rows). Override with TERMINAL_HELLO_SIZE.
SIZE="${TERMINAL_HELLO_SIZE:-40x20}"
 
if ! command -v chafa >/dev/null 2>&1; then
  echo "terminal-hello: chafa is not installed. Run 'brew install chafa' (macOS) or 'sudo apt install chafa' (Linux)."
  return 0 2>/dev/null || exit 0
fi
 
if [[ -f "$IMG" ]]; then
  chafa "$IMG" --size="$SIZE"
else
  echo "terminal-hello: no image found at $IMG"
  echo "Add one, or set TERMINAL_HELLO_IMG to point somewhere else."
fi

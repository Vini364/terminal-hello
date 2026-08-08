#!/usr/bin/env bash
#
# terminal-hello installer
# Copies hello.sh into ~/.config/terminal-hello and adds a line to your
# shell config so it runs automatically on new terminal sessions.
 
set -e
 
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$HOME/.config/terminal-hello"
SHELL_RC="$HOME/.zshrc"
 
mkdir -p "$INSTALL_DIR"
cp "$REPO_DIR/hello.sh" "$INSTALL_DIR/hello.sh"
chmod +x "$INSTALL_DIR/hello.sh"
 
if [[ ! -f "$INSTALL_DIR/photo.jpg" ]]; then
  echo "No photo found at $INSTALL_DIR/photo.jpg"
  echo "Copy a photo there (any name is fine, just update TERMINAL_HELLO_IMG if needed)."
fi
 
MARKER="# terminal-hello"
if ! grep -q "$MARKER" "$SHELL_RC" 2>/dev/null; then
  {
    echo ""
    echo "$MARKER"
    echo "source \"$INSTALL_DIR/hello.sh\""
  } >> "$SHELL_RC"
  echo "Added terminal-hello to $SHELL_RC"
else
  echo "terminal-hello already present in $SHELL_RC, skipping."
fi
 
echo "Done. Open a new terminal window (or run 'source $SHELL_RC') to see it in action."

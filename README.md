# terminal-hello 👋

A customizable "hello" script — show any photo when you open your terminal.

Uses [chafa](https://hpjansson.org/chafa/) to render an image inline, right in your shell.
Works great in terminals that support the Kitty graphics protocol (Ghostty, Kitty, WezTerm),
and falls back to ANSI/ASCII art elsewhere.

![placeholder](example.jpg)

## Install

1. Install chafa:
   ```bash
   # macOS
   brew install chafa

   # Debian/Ubuntu
   sudo apt install chafa
   ```

2. Clone this repo and run the installer:
   ```bash
   git clone https://github.com/Vini364/terminal-hello.git
   cd terminal-hello
   ./install.sh
   ```

3. Drop a photo at `~/.config/terminal-hello/photo.jpg` (any image works — jpg, png, etc.)

4. Open a new terminal window. That's it.

## Configuration

Both of these can be set in your `.zshrc` **before** the `source` line that `install.sh` adds:

| Variable | Default | Description |
|---|---|---|
| `TERMINAL_HELLO_IMG` | `~/.config/terminal-hello/photo.jpg` | Path to the image to display |
| `TERMINAL_HELLO_SIZE` | `40x20` | Size of the rendered image (cols x rows) |

Example:
```bash
export TERMINAL_HELLO_IMG="$HOME/Pictures/dog.jpg"
export TERMINAL_HELLO_SIZE="60x30"
```

## Manual setup (without install.sh)

Add this line to your `~/.zshrc`:
```bash
source "$HOME/.config/terminal-hello/hello.sh"
```

## Notes

- This repo does **not** include any personal photos — only a placeholder. Add your own image locally after cloning.
- Tested on Ghostty (macOS). Should work anywhere chafa + a graphics-protocol-capable terminal are available.

## License

MIT
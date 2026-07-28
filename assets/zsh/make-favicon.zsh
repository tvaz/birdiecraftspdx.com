#!/usr/bin/env zsh

# Source PNG (exported from Inkscape at 256px or larger)
SRC="icon.png"
BG="#ffffff" 

# Create a backgrounded version of the icon
convert "$SRC" -background "$BG" -alpha remove -alpha off icon-bg.png

# Sizes to generate
sizes=(256 128 64 48 32 16)

# Generate each size as a pure ICO (no PNG layers)
for s in $sizes; do
    convert "$SRC" -resize ${s}x${s} -colors 256 "${s}.ico"
done

# Combine into one favicon.ico
convert 256.ico 128.ico 64.ico 48.ico 32.ico 16.ico favicon.ico

# Clean up temporary files
rm 256.ico 128.ico 64.ico 48.ico 32.ico 16.ico

echo "favicon.ico generated (pure ICO, no PNG layers)"


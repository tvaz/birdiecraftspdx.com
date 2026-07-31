#!/bin/zsh

makemanifest() {
  dir="$1"
  MANIFEST_FILE="$dir/manifest.json"

  # Use zsh globbing to find images safely
  images=(${~dir}/*.(jpg|jpeg|png|webp)(N))

  # Build JSON array
  json="["
  for img in $images; do
    filename="${img:t}"   # :t = tail (basename)
    json="$json\"$filename\","
  done

  # Remove trailing comma if present
  json="${json%,}"
  json="$json]"

  # Write manifest.json
  echo "$json" > "$MANIFEST_FILE"

  echo "Generated $MANIFEST_FILE with ${#images[@]} images."
}

# Mending gallery
GALLERY_DIR="../gallery"

makemanifest "$GALLERY_DIR/mending"
makemanifest "$GALLERY_DIR/sashiko"
makemanifest "$GALLERY_DIR/cosplay"
makemanifest "$GALLERY_DIR/crochet"
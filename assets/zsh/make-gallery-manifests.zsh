#!/bin/zsh

makemanifest() {
  dir="$1"
  MANIFEST_FILE="$dir/manifest.json"

  # Find images
  images=(${~dir}/*.(jpg|jpeg|png|webp)(N))

  json="["
  for img in $images; do
    filename="${img:t}"
    json="$json{\"file\":\"$filename\",\"caption\":\"\"},"
  done

  # Remove trailing comma
  json="${json%,}"
  json="$json]"

  echo "$json" > "$MANIFEST_FILE"
  echo "Generated $MANIFEST_FILE with ${#images[@]} images."
}

GALLERY_DIR="../gallery"

makemanifest "$GALLERY_DIR/mending"
makemanifest "$GALLERY_DIR/sashiko"
makemanifest "$GALLERY_DIR/cosplay"
makemanifest "$GALLERY_DIR/crochet"
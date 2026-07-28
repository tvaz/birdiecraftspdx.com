#!/bin/zsh

GALLERY_DIR="../gallery"
MANIFEST_FILE="$GALLERY_DIR/manifest.json"

# Find all image files (jpg, jpeg, png, webp)
images=($(ls $GALLERY_DIR | grep -Ei '\.(jpg|jpeg|png|webp)$'))

# Build JSON array
json="["
for img in $images; do
  json="$json\"$img\","
done

# Remove trailing comma
json="${json%,}"
json="$json]"

# Write to manifest.json
echo $json > $MANIFEST_FILE

echo "Generated $MANIFEST_FILE with ${#images[@]} images."

const scriptTag = document.currentScript;
const galleryDir = scriptTag.dataset.galleryDir;

fetch(`${galleryDir}/manifest.json`)
  .then(response => response.json())
  .then(items => {
    const galleryGrid = document.getElementById("gallery-grid");

    items.forEach(entry => {
      const item = document.createElement("div");
      item.className = "gallery-item";

      const img = document.createElement("img");
      img.src = `${galleryDir}/${entry.file}`;
      img.alt = entry.caption || "";
      img.loading = "lazy";

      const caption = document.createElement("p");
      caption.className = "gallery-caption";
      caption.textContent = entry.caption || "";

      item.appendChild(img);
      item.appendChild(caption);

      galleryGrid.appendChild(item);
    });
  })
  .catch(err => console.error("Gallery manifest load error:", err));

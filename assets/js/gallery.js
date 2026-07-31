const scriptTag = document.currentScript;
const galleryDir = scriptTag.dataset.galleryDir;

fetch(`${galleryDir}/manifest.json`)
  .then(response => response.json())
  .then(images => {
    const mendingGalleryGrid = document.getElementById("gallery-grid");

    images.forEach(file => {
      const item = document.createElement("div");
      item.className = "gallery-item";

      item.innerHTML = `
        <img src="/assets/gallery/mending/${file}" alt="" loading="lazy">
      `;

      mendingGalleryGrid.appendChild(item);
    });
  })
  .catch(err => console.error("Gallery manifest load error:", err));


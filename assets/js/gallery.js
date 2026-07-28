fetch('/assets/gallery/manifest.json')
  .then(response => response.json())
  .then(images => {
    const galleryGrid = document.getElementById("gallery-grid");

    images.forEach(file => {
      const item = document.createElement("div");
      item.className = "gallery-item";

      item.innerHTML = `
        <img src="/assets/gallery/${file}" alt="" loading="lazy">
      `;

      galleryGrid.appendChild(item);
    });
  })
  .catch(err => console.error("Gallery manifest load error:", err));

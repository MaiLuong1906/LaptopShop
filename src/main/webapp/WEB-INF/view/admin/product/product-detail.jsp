<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>ROG Strix SCAR 16 (2024) - LaptopShop</title>

            <!-- Google Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">

            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

            <!-- Custom Styles -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/home.css">

            <style>
                .main-product-image {
                    transition: opacity 0.3s ease;
                }
            </style>
        </head>

        <body class="dark-theme">

            <!-- Header Section -->
            <jsp:include page="../../layout/header.jsp" />

            <!-- Product Detail Section -->
            <section class="product-detail-section">
                <div class="container">
                    <!-- Breadcrumbs -->
                    <div class="breadcrumb-glass">
                        <a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-house"></i> Home</a>
                        <span class="separator">/</span>
                        <a href="#">${product.target}</a>
                        <span class="separator">/</span>
                        <span class="active">${product.name}</span>
                    </div>

                    <div class="row gx-5">
                        <!-- Left: Media -->
                        <div class="col-lg-5 mb-5 mb-lg-0">
                            <div class="detail-image-card">
                                <div class="product-badge discount" style="left: 20px; top: 20px;">-10%</div>
                                <img src="${not empty product.image ? '/images/product/'.concat(product.image) : 'https://via.placeholder.com/400?text=No+Image'}"
                                    alt="${not empty product.name ? product.name : 'Sản phẩm'}"
                                    class="main-product-image w-100" id="mainImage">

                            </div>
                            <!-- Thumbnails -->
                            <div class="thumbnail-gallery">
                                <img src="https://dlcdnwebimgs.asus.com/gain/495EC7BD-7ACA-4ED2-85D7-34FDF7A4BB7A/w240/h175"
                                    class="thumbnail-img active" alt="thumb1">
                                <img src="https://dlcdnwebimgs.asus.com/gain/B574F96C-2DB5-4D01-9FDB-5A0EF223A401/w240/h175"
                                    class="thumbnail-img" alt="thumb2">
                                <img src="https://dlcdnwebimgs.asus.com/gain/DF362EA2-BFA1-456A-8A46-60CF6480F951/w240/h175"
                                    class="thumbnail-img" alt="thumb3">
                                <img src="https://dlcdnwebimgs.asus.com/gain/971BB96D-69B6-4A57-8E83-2940263EBBD5/w240/h175"
                                    class="thumbnail-img" alt="thumb4">
                            </div>
                        </div>

                        <!-- Right: Information -->
                        <div class="col-lg-7">
                            <div class="detail-info">
                                <span class="detail-category">${product.target}</span>
                                <h1 class="detail-title">${product.name}</h1>

                                <div class="detail-rating">
                                    <div class="text-warning">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star-half-stroke"></i>
                                    </div>
                                    <span class="text-secondary"> | <span class="text-success"><i
                                                class="fa-solid fa-check-circle"></i>Tồn
                                            kho ${product.quantity}</span></span>
                                </div>

                                <div class="detail-price-box">
                                    <h2 class="detail-price text-gradient">${product.price} VND</h2>
                                </div>

                                <!-- Quick Specs Grid -->
                                <div class="spec-grid">
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fa-solid fa-microchip"></i></div>
                                        <div class="spec-info">
                                            <h4>Processor</h4>
                                            <p>Intel Core i9-14900HX</p>
                                        </div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fa-solid fa-memory"></i></div>
                                        <div class="spec-info">
                                            <h4>Memory</h4>
                                            <p>32GB DDR5 5600MHz</p>
                                        </div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fa-solid fa-hard-drive"></i></div>
                                        <div class="spec-info">
                                            <h4>Storage</h4>
                                            <p>2TB PCIe 4.0 NVMe SSD</p>
                                        </div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fa-solid fa-desktop"></i></div>
                                        <div class="spec-info">
                                            <h4>Display</h4>
                                            <p>16" QHD+ 240Hz Mini LED</p>
                                        </div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fa-solid fa-gamepad"></i></div>
                                        <div class="spec-info">
                                            <h4>Graphics</h4>
                                            <p>NVIDIA RTX 4080 12GB</p>
                                        </div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fa-brands fa-windows"></i></div>
                                        <div class="spec-info">
                                            <h4>OS</h4>
                                            <p>Windows 11 Home</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Actions -->
                                <div class="qty-wrapper">
                                    <span class="me-3 text-secondary">Quantity:</span>
                                    <div class="qty-selector">
                                        <button class="qty-btn" id="btn-minus">-</button>
                                        <input type="number" id="qty" class="qty-input" value="1" min="1" max="10"
                                            readonly>
                                        <button class="qty-btn" id="btn-plus">+</button>
                                    </div>
                                </div>

                                <div class="action-buttons">
                                    <button class="btn-glow"><i class="fa-solid fa-cart-plus"></i> Add to Cart</button>
                                    <button class="btn-gradient"><i class="fa-solid fa-credit-card"></i> Buy
                                        Now</button>
                                    <button class="btn-wishlist" title="Add to Wishlist"><i
                                            class="fa-regular fa-heart"></i></button>
                                </div>

                                <ul class="policy-list">
                                    <li><i class="fa-solid fa-truck-fast"></i> Free Global Shipping over $1000</li>
                                    <li><i class="fa-solid fa-shield-halved"></i> 2-Year International Warranty</li>
                                    <li><i class="fa-solid fa-arrow-rotate-left"></i> 30-Day Money Back Guarantee</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Bottom Detail Section -->
                    <div class="detail-section-bottom">
                        <div class="info-card">
                            <h2 class="info-title"><i class="fa-solid fa-circle-info"></i> Product Overview</h2>
                            <div class="info-content">
                                <p>Draw more frames and win more games with the raw horsepower of the brand new 2024 ROG
                                    Strix SCAR 16 in Windows 11 Pro. Tackle any enemy with an <strong>Intel® Core™ i9
                                        Processor 14900HX</strong>, paired with an <strong>NVIDIA® GeForce RTX™ 4080
                                        Laptop GPU</strong> with an incredible 175W max TGP. Leave loading screens in
                                    the dust thanks to a dedicated <strong>2TB PCIe Gen4x4 solid state drive</strong>.
                                </p>

                                <h3>Key Features</h3>
                                <ul>
                                    <li><strong>Nebula HDR Display™</strong>: Powered by Mini LED for deepest blacks and
                                        dazzling highlights.</li>
                                    <li><strong>Thermal Grizzly Conductonaut Extreme</strong>: Applied to both the CPU
                                        and GPU for significantly cooler temperatures under load.</li>
                                    <li><strong>Tri-Fan Technology</strong>: Introduces a third fan that helps keep the
                                        GPU and VRAM cool.</li>
                                    <li><strong>Per-Key RGB Keyboard</strong>: Game in style with Aura Sync compatible
                                        lighting.</li>
                                    <li><strong>Dolby Atmos Audio</strong>: Surround sound virtualization for immersive
                                        gaming experiences.</li>
                                </ul>

                                <h3>Detailed Specifications</h3>
                                <div class="table-responsive mt-3">
                                    <table class="table table-dark table-striped table-bordered"
                                        style="--bs-table-bg: transparent; border-color: var(--glass-border);">
                                        <tbody>
                                            <tr>
                                                <th style="width: 30%; color: var(--text-secondary);">Processor</th>
                                                <td>Intel® Core™ i9 Processor 14900HX 2.2 GHz (36MB Cache, up to 5.8
                                                    GHz, 24 cores, 32 Threads)</td>
                                            </tr>
                                            <tr>
                                                <th style="color: var(--text-secondary);">Graphics</th>
                                                <td>NVIDIA® GeForce RTX™ 4080 Laptop GPU, 12GB GDDR6</td>
                                            </tr>
                                            <tr>
                                                <th style="color: var(--text-secondary);">Display</th>
                                                <td>16-inch, QHD+ 16:10 (2560 x 1600, WQXGA), Mini LED, Anti-glare
                                                    display, DCI-P3: 100%, Refresh Rate: 240Hz, Response Time: 3ms</td>
                                            </tr>
                                            <tr>
                                                <th style="color: var(--text-secondary);">Memory</th>
                                                <td>32GB DDR5-5600 SO-DIMM, Max Capacity: 64GB</td>
                                            </tr>
                                            <tr>
                                                <th style="color: var(--text-secondary);">Storage</th>
                                                <td>2TB PCIe® 4.0 NVMe™ M.2 Performance SSD</td>
                                            </tr>
                                            <tr>
                                                <th style="color: var(--text-secondary);">I/O Ports</th>
                                                <td>1x 3.5mm Combo Audio Jack, 1x HDMI 2.1 FRL, 2x USB 3.2 Gen 2 Type-A,
                                                    1x USB 3.2 Gen 2 Type-C support DisplayPort™ / power delivery /
                                                    G-SYNC, 1x 2.5G LAN port, 1x Thunderbolt™ 4 support DisplayPort™
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="color: var(--text-secondary);">Battery</th>
                                                <td>90WHrs, 4S1P, 4-cell Li-ion</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Footer -->
            <jsp:include page="../../layout/footer.jsp" />

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>

            <!-- Custom Logic -->
            <script src="${pageContext.request.contextPath}/client/js/home.js"></script>

            <!-- Custom Logic for product detail -->
            <script>
                document.addEventListener('DOMContentLoaded', () => {
                    const mainImg = document.getElementById('mainImage');
                    const thumbnails = document.querySelectorAll('.thumbnail-img');

                    thumbnails.forEach(thumb => {
                        thumb.addEventListener('click', function () {
                            thumbnails.forEach(t => t.classList.remove('active'));
                            this.classList.add('active');
                            mainImg.style.opacity = 0;
                            setTimeout(() => {
                                mainImg.src = this.src;
                                mainImg.style.opacity = 1;
                            }, 150);
                        });
                    });

                    // Quantity selector logic
                    const qtyInput = document.getElementById('qty');
                    document.getElementById('btn-minus').addEventListener('click', () => {
                        if (parseInt(qtyInput.value) > 1) qtyInput.value--;
                    });
                    document.getElementById('btn-plus').addEventListener('click', () => {
                        if (parseInt(qtyInput.value) < 10) qtyInput.value++;
                    });
                });
            </script>
        </body>

        </html>
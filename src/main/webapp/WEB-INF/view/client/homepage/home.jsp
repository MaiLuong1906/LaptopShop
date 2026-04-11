<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>LaptopShop Premium | Discover Future Tech</title>

            <!-- Google Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;700&display=swap"
                rel="stylesheet">

            <!-- Bootstrap CSS (if you use it globally) -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

            <!-- Custom Styles -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/home.css">
        </head>

        <body class="dark-theme">

            <!-- Header Section placeholder -->
            <jsp:include page="../layout/header.jsp" />

            <!-- Hero Section -->
            <section class="hero-section">
                <div class="hero-background"></div>
                <div class="container">
                    <div class="row align-items-center min-vh-100">
                        <div class="col-lg-6 hero-content">
                            <h1 class="hero-title">Experience <span class="text-gradient">Ultimate</span> Performance
                            </h1>
                            <p class="hero-subtitle">Next-generation laptops designed for creators, gamers, and
                                professionals who demand edge-cutting technology.</p>
                            <div class="hero-buttons">
                                <button class="btn-glow">Explore Now <i
                                        class="fa-solid fa-arrow-right offset-icon"></i></button>
                                <button class="btn-glass">Watch Video</button>
                            </div>
                        </div>
                        <div class="col-lg-6 hero-image-wrapper">
                            <!-- Sample High Quality Unsplash Image -->
                            <img src="https://images.unsplash.com/photo-1603302576837-37561b2e2302?auto=format&fit=crop&q=80&w=1000"
                                alt="Premium Laptop" class="floating-laptop">
                        </div>
                    </div>
                </div>
            </section>

            <!-- Trending Products Section -->
            <section class="products-section">
                <div class="container">
                    <div class="section-header text-center mb-5">
                        <h2 class="section-title">Trending <span class="text-gradient">Laptops</span></h2>
                        <p class="section-desc">Discover our best sellers with unprecedented discounts.</p>
                    </div>

                    <div class="row product-grid" id="productGrid">
                        <c:forEach var="product" items="${products}">
                            <div class="col-lg-3 col-md-6 mb-4">
                                <div class="product-card glass-card h-100 d-flex flex-column"
                                    style="box-shadow: 0 4px 6px rgba(0,0,0,0.1); border-radius: 8px; overflow: hidden; background: #fff;">
                                    <div class="product-image"
                                        style="position: relative; text-align: center; padding: 10px; cursor: pointer; min-height: 200px; display: flex; align-items: center; justify-content: center;">
                                        <a href="${pageContext.request.contextPath}/product/detail/${product.id}">
                                            <img src="${not empty product.image ? '/images/product/'.concat(product.image) : 'https://via.placeholder.com/200?text=No+Image'}"
                                                alt="${not empty product.name ? product.name : 'Sản phẩm'}"
                                                style="max-height: 200px; object-fit: contain; width: 100%; transition: transform 0.3s;"
                                                onerror="this.onerror=null;this.src='https://via.placeholder.com/200?text=No+Image';"
                                                onmouseover="this.style.transform='scale(1.05)'"
                                                onmouseout="this.style.transform='scale(1)'">
                                        </a>
                                    </div>
                                    <div class="product-info d-flex flex-column" style="padding: 15px; flex-grow: 1;">
                                        <a href="${pageContext.request.contextPath}/product/detail/${product.id}"
                                            style="text-decoration: none; color: inherit;">
                                            <h5 class="product-title"
                                                style="font-size: 1.1rem; font-weight: 600; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; margin-bottom: 8px; min-height: 26px;"
                                                title="${product.name}">
                                                <c:out
                                                    value="${not empty product.name ? product.name : 'Sản phẩm chưa có tên'}" />
                                            </h5>
                                        </a>
                                        <div class="product-price mb-3">
                                            <span class="price-current"
                                                style="color: var(--accent-blue); font-weight: bold; font-size: 1.2rem;">${product.price}
                                                VND</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>

            <!-- Footer -->
            <jsp:include page="../layout/footer.jsp" />

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <!-- Custom Logic -->
            <script src="${pageContext.request.contextPath}/client/js/home.js"></script>
        </body>

        </html>
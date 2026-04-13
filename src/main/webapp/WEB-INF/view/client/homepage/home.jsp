<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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

                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
                    crossorigin="anonymous">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

                <!-- Custom Styles -->
                <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/home.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/cart.css">
            </head>

            <body class="dark-theme">

                <!-- Header -->
                <jsp:include page="../layout/header.jsp" />

                <!-- Hero Section -->
                <section class="hero-section">
                    <div class="hero-background"></div>
                    <div class="container">
                        <div class="row align-items-center min-vh-100">
                            <div class="col-lg-6 hero-content">
                                <h1 class="hero-title">Experience <span class="text-gradient">Ultimate</span>
                                    Performance</h1>
                                <p class="hero-subtitle">Next-generation laptops designed for creators, gamers, and
                                    professionals who demand edge-cutting technology.</p>
                                <div class="hero-buttons">
                                    <a href="#products" class="btn-glow">Explore Now <i
                                            class="fa-solid fa-arrow-right offset-icon"></i></a>
                                    <button class="btn-glass">Watch Video</button>
                                </div>
                            </div>
                            <div class="col-lg-6 hero-image-wrapper">
                                <img src="https://images.unsplash.com/photo-1603302576837-37561b2e2302?auto=format&fit=crop&q=80&w=1000"
                                    alt="Premium Laptop" class="floating-laptop">
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Trending Products Section -->
                <section class="products-section" id="products">
                    <div class="container">
                        <div class="section-header text-center mb-5">
                            <h2 class="section-title">Trending <span class="text-gradient">Laptops</span></h2>
                            <p class="section-desc">Discover our best sellers with unprecedented discounts.</p>
                        </div>

                        <div class="row g-4" id="productGrid">
                            <c:forEach var="product" items="${products}">
                                <div class="col-xl-3 col-lg-4 col-md-6">
                                    <div class="product-card-new">
                                        <!-- Badge -->
                                        <c:if test="${product.sold > 0}">
                                            <span class="pc-badge">Hot</span>
                                        </c:if>

                                        <!-- Image -->
                                        <div class="pc-image-wrap">
                                            <a href="${pageContext.request.contextPath}/product/detail/${product.id}">
                                                <img src="${not empty product.image ? pageContext.request.contextPath.concat('/images/product/').concat(product.image) : 'https://placehold.co/300x220/1e2937/38bdf8?text=No+Image'}"
                                                    alt="${not empty product.name ? product.name : 'Sản phẩm'}"
                                                    class="pc-image"
                                                    onerror="this.onerror=null;this.src='https://placehold.co/300x220/1e2937/38bdf8?text=No+Image';">
                                            </a>
                                            <!-- Quick view overlay -->
                                            <div class="pc-overlay">
                                                <a href="${pageContext.request.contextPath}/product/detail/${product.id}"
                                                    class="pc-overlay-btn" title="Xem chi tiết">
                                                    <i class="fa-solid fa-eye"></i>
                                                </a>
                                            </div>
                                        </div>

                                        <!-- Info -->
                                        <div class="pc-body">
                                            <!-- Brand badge -->
                                            <c:if test="${not empty product.factory}">
                                                <span class="pc-brand">${product.factory}</span>
                                            </c:if>
                                            <c:if test="${empty product.factory}">
                                                <span class="pc-brand">Laptop</span>
                                            </c:if>

                                            <a href="${pageContext.request.contextPath}/product/detail/${product.id}"
                                                class="pc-name-link">
                                                <h5 class="pc-name" title="${product.name}">
                                                    <c:out
                                                        value="${not empty product.name ? product.name : 'Sản phẩm chưa có tên'}" />
                                                </h5>
                                            </a>

                                            <c:if test="${not empty product.shortDesc}">
                                                <p class="pc-desc">${product.shortDesc}</p>
                                            </c:if>

                                            <div class="pc-footer">
                                                <div class="pc-price">
                                                    <fmt:formatNumber value="${product.price}" type="number"
                                                        groupingUsed="true" />
                                                    <span class="pc-currency">₫</span>
                                                </div>

                                                <form method="post"
                                                    action="${pageContext.request.contextPath}/add-product-to-cart/${product.id}"
                                                    class="pc-cart-form">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button type="submit" class="pc-add-cart" title="Thêm vào giỏ hàng">
                                                        <i class="fa-solid fa-cart-plus"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${empty products}">
                                <div class="col-12 text-center py-5">
                                    <i class="fa-solid fa-box-open"
                                        style="font-size: 4rem; color: var(--text-secondary); margin-bottom: 1rem;"></i>
                                    <p style="color: var(--text-secondary); font-size: 1.2rem;">Chưa có sản phẩm nào.
                                    </p>
                                </div>
                            </c:if>
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
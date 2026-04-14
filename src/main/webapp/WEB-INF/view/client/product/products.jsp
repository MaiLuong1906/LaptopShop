<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm | LaptopShop Premium</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/products.css">
</head>
<body class="dark-theme">

    <!-- Header -->
    <jsp:include page="../layout/header.jsp" />

    <!-- Page Header Info -->
    <div class="page-header">
        <h1 class="page-title">Khám phá <span class="text-gradient">Laptop</span></h1>
        <p style="color: #94a3b8; font-size: 1.1rem;">Tìm kiếm cấu hình tối ưu nhất cho nhu cầu của bạn</p>
    </div>

    <!-- Main Content -->
    <div class="container pb-5">
        <div class="row">
            
            <!-- Sidebar Filters (Left) -->
            <div class="col-lg-3 col-md-4 mb-4">
                <form id="filterForm" action="/products" method="GET">
                    
                    <!-- Form action handles filters automatically -->

                    <div class="filter-sidebar">
                        
                        <!-- Brand Filter -->
                        <div class="filter-group">
                            <h4 class="filter-title"><i class="fas fa-tags"></i> Thương hiệu</h4>
                            
                            <c:set var="factoryParams" value="${paramValues.factory}" />
                            <div class="filter-item">
                                <label><input type="checkbox" name="factory" value="Apple" class="custom-checkbox"
                                    <c:forEach var="f" items="${factoryParams}"><c:if test="${f == 'Apple'}">checked</c:if></c:forEach>
                                > Apple</label>
                            </div>
                            <div class="filter-item">
                                <label><input type="checkbox" name="factory" value="Asus" class="custom-checkbox"
                                    <c:forEach var="f" items="${factoryParams}"><c:if test="${f == 'Asus'}">checked</c:if></c:forEach>
                                > Asus</label>
                            </div>
                            <div class="filter-item">
                                <label><input type="checkbox" name="factory" value="Acer" class="custom-checkbox"
                                    <c:forEach var="f" items="${factoryParams}"><c:if test="${f == 'Acer'}">checked</c:if></c:forEach>
                                > Acer</label>
                            </div>
                            <div class="filter-item">
                                <label><input type="checkbox" name="factory" value="Dell" class="custom-checkbox"
                                    <c:forEach var="f" items="${factoryParams}"><c:if test="${f == 'Dell'}">checked</c:if></c:forEach>
                                > Dell</label>
                            </div>
                            <div class="filter-item">
                                <label><input type="checkbox" name="factory" value="HP" class="custom-checkbox"
                                    <c:forEach var="f" items="${factoryParams}"><c:if test="${f == 'HP'}">checked</c:if></c:forEach>
                                > HP</label>
                            </div>
                            <div class="filter-item">
                                <label><input type="checkbox" name="factory" value="Lenovo" class="custom-checkbox"
                                    <c:forEach var="f" items="${factoryParams}"><c:if test="${f == 'Lenovo'}">checked</c:if></c:forEach>
                                > Lenovo</label>
                            </div>
                        </div>

                        <!-- Target Filter -->
                        <div class="filter-group">
                            <h4 class="filter-title"><i class="fas fa-bullseye"></i> Nhu cầu</h4>
                            <c:set var="targetParams" value="${paramValues.target}" />
                            <div class="filter-item">
                                <label><input type="checkbox" name="target" value="Gaming" class="custom-checkbox"
                                    <c:forEach var="t" items="${targetParams}"><c:if test="${t == 'Gaming'}">checked</c:if></c:forEach>
                                > Gaming</label>
                            </div>
                            <div class="filter-item">
                                <label><input type="checkbox" name="target" value="VP" class="custom-checkbox"
                                    <c:forEach var="t" items="${targetParams}"><c:if test="${t == 'VP'}">checked</c:if></c:forEach>
                                > Sinh viên - VP</label>
                            </div>
                            <div class="filter-item">
                                <label><input type="checkbox" name="target" value="Graphic" class="custom-checkbox"
                                    <c:forEach var="t" items="${targetParams}"><c:if test="${t == 'Graphic'}">checked</c:if></c:forEach>
                                > Đồ họa - Kỹ thuật</label>
                            </div>
                            <div class="filter-item">
                                <label><input type="checkbox" name="target" value="Thin" class="custom-checkbox"
                                    <c:forEach var="t" items="${targetParams}"><c:if test="${t == 'Thin'}">checked</c:if></c:forEach>
                                > Mỏng nhẹ</label>
                            </div>
                        </div>

                        <!-- Price Filter -->
                        <div class="filter-group">
                            <h4 class="filter-title"><i class="fas fa-wallet"></i> Mức giá</h4>
                            <div class="price-inputs">
                                <div class="price-input-wrap">
                                    <input type="number" name="minPrice" class="price-input" placeholder="Từ (VND)" value="${param.minPrice}">
                                </div>
                                <div class="price-input-wrap">
                                    <input type="number" name="maxPrice" class="price-input" placeholder="Đến (VND)" value="${param.maxPrice}">
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn-filter"><i class="fas fa-filter me-2"></i> Lọc sản phẩm</button>
                    </div>
                </form>
            </div>

            <!-- Product Grid (Right) -->
            <div class="col-lg-9 col-md-8">
                
                <!-- Toolbar for results info -->
                <div class="toolbar">
                    <span style="color: #cbd5e1;">Hiển thị <strong>${products != null ? products.size() : 12}</strong> kết quả</span>
                </div>

                <!-- Products Display Area -->
                <div class="row g-4" id="productGrid">
                    <c:forEach var="product" items="${products}">
                        <div class="col-xl-4 col-lg-6 col-md-6">
                            <!-- Reusing the PC Card Component from Homepage -->
                            <div class="product-card-new">
                                <c:if test="${product.sold > 10}">
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
                                        <a href="${pageContext.request.contextPath}/product/detail/${product.id}" class="pc-overlay-btn" title="Xem chi tiết">
                                            <i class="fa-solid fa-eye"></i>
                                        </a>
                                    </div>
                                </div>

                                <!-- Info -->
                                <div class="pc-body">
                                    <c:choose>
                                        <c:when test="${not empty product.factory}">
                                            <span class="pc-brand">${product.factory}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="pc-brand">Laptop</span>
                                        </c:otherwise>
                                    </c:choose>

                                    <a href="${pageContext.request.contextPath}/product/detail/${product.id}" class="pc-name-link">
                                        <h5 class="pc-name" title="${product.name}">
                                            <c:out value="${not empty product.name ? product.name : 'Sản phẩm chưa có tên'}" />
                                        </h5>
                                    </a>

                                    <c:if test="${not empty product.shortDesc}">
                                        <p class="pc-desc">${product.shortDesc}</p>
                                    </c:if>

                                    <div class="pc-footer">
                                        <div class="pc-price">
                                            <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" />
                                            <span class="pc-currency">₫</span>
                                        </div>

                                        <!-- Add to cart -->
                                        <form method="post" action="${pageContext.request.contextPath}/add-product-to-cart/${product.id}" class="pc-cart-form">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button type="submit" class="pc-add-cart" title="Thêm vào giỏ hàng">
                                                <i class="fa-solid fa-cart-plus"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <!-- Empty State -->
                    <c:if test="${empty products}">
                        <!-- Demo content if there's no actual dynamic products passed yet -->
                        <div class="col-12 text-center py-5" style="background: rgba(30, 41, 59, 0.4); border-radius: 16px; border: 1px dashed rgba(255,255,255,0.1);">
                            <div class="empty-state-icon" style="font-size: 5rem; color: #38bdf8; margin-bottom: 20px; opacity: 0.5;">
                                <i class="fa-solid fa-laptop-medical"></i>
                            </div>
                            <h3 class="mb-3">Không tìm thấy sản phẩm</h3>
                            <p style="color: #94a3b8; max-width: 500px; margin: 0 auto 24px;"> Rất tiếc, chưa có sản phẩm nào phù hợp với bộ lọc bạn chọn. Vui lòng thử tìm kiếm với các tùy chọn khác.</p>
                            <a href="/products" class="btn btn-outline-info" style="border-radius: 8px; border-color: #38bdf8; color: #38bdf8;">Xoá bộ lọc</a>
                        </div>
                    </c:if>
                </div>

                <!-- Pagination (Only display if totalPages > 1) -->
                <c:if test="${totalPages > 0}">
                    <nav aria-label="Product Pagination" class="mt-5 mb-4">
                        <ul class="pagination justify-content-center glass-pagination">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="#" aria-label="Previous" onclick="changePage('${currentPage - 1}'); return false;">
                                    <i class="fas fa-chevron-left"></i>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="#" onclick="changePage('${i}'); return false;">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <a class="page-link" href="#" aria-label="Next" onclick="changePage('${currentPage + 1}'); return false;">
                                    <i class="fas fa-chevron-right"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </c:if>
                <!-- Optional: Render static pagination demo if there's no backend connected yet -->
                <c:if test="${empty totalPages}">
                    <nav aria-label="Product Pagination" class="mt-5 mb-4">
                        <ul class="pagination justify-content-center glass-pagination">
                            <li class="page-item disabled">
                                <a class="page-link" href="#"><i class="fas fa-chevron-left"></i></a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a>
                            </li>
                        </ul>
                    </nav>
                </c:if>

            </div>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="../layout/footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    
    <!-- Custom Scripts -->
    <script src="${pageContext.request.contextPath}/client/js/products.js"></script>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Quản lý sản phẩm | Admin</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
                        rel="stylesheet" crossorigin="anonymous">
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <link rel="stylesheet" href="/css/dashboard.css">
                    <link rel="stylesheet" href="/css/admin-products.css">
                </head>


                <body>
                    <div class="dashboard-layout">
                        <jsp:include page="../layout/sidebar.jsp" />

                        <main class="main-content">
                            <jsp:include page="../layout/header.jsp" />

                            <div class="page-content">
                                <!-- Page Title -->
                                <div class="page-title-section">
                                    <div>
                                        <h1>Quản lý sản phẩm</h1>
                                        <p style="color: #64748b; font-size: 0.875rem; margin-top: 4px;">
                                            Danh sách tất cả sản phẩm trong hệ thống
                                        </p>
                                    </div>
                                    <div class="page-actions">
                                        <a href="${pageContext.request.contextPath}/admin/product/create"
                                            class="btn btn-primary">
                                            <i class="fas fa-plus me-1"></i> Thêm sản phẩm
                                        </a>
                                    </div>
                                </div>

                                <!-- Table Card -->
                                <div class="products-table-card">
                                    <!-- Card header bar -->
                                    <div class="card-header-bar">
                                        <h5><i class="fas fa-laptop me-2" style="color: #38bdf8;"></i> Danh sách sản
                                            phẩm</h5>
                                        <div class="search-input-wrap">
                                            <i class="fas fa-search"></i>
                                            <input type="text" id="productSearch" placeholder="Tìm kiếm sản phẩm..."
                                                onkeyup="filterProducts()" />
                                        </div>
                                    </div>

                                    <!-- Table -->
                                    <div class="table-responsive-wrap">
                                        <table class="admin-table" id="productsTable">
                                            <thead>
                                                <tr>
                                                    <th style="width: 50px;">#</th>
                                                    <th>Sản phẩm</th>
                                                    <th>Thương hiệu</th>
                                                    <th>Giá bán</th>
                                                    <th>Kho</th>
                                                    <th>Đã bán</th>
                                                    <th style="text-align: right;">Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody id="productTableBody">
                                                <c:forEach var="product" items="${products}" varStatus="status">
                                                    <tr class="product-row">
                                                        <td style="color: #64748b; font-size: 0.82rem;">${status.count}
                                                        </td>

                                                        <!-- Product name + image -->
                                                        <td>
                                                            <div class="prod-name-cell">
                                                                <div class="prod-thumb-wrap">
                                                                    <img src="${not empty product.image ? pageContext.request.contextPath.concat('/images/product/').concat(product.image) : 'https://placehold.co/56x56/0f172a/38bdf8?text=N/A'}"
                                                                        alt="${product.name}" class="prod-thumb"
                                                                        onerror="this.onerror=null;this.src='https://placehold.co/56x56/0f172a/38bdf8?text=N/A';">
                                                                </div>
                                                                <div>
                                                                    <a href="${pageContext.request.contextPath}/product/detail/${product.id}"
                                                                        class="prod-name-text" title="${product.name}">
                                                                        <c:out
                                                                            value="${not empty product.name ? product.name : 'Chưa có tên'}" />
                                                                    </a>
                                                                    <c:if test="${not empty product.shortDesc}">
                                                                        <div class="prod-sub">${product.shortDesc}</div>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </td>

                                                        <!-- Factory -->
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${not empty product.factory}">
                                                                    <span
                                                                        class="badge-factory">${product.factory}</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span
                                                                        style="color: #475569; font-size: 0.82rem;">—</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>

                                                        <!-- Price -->
                                                        <td>
                                                            <span class="price-tag">
                                                                <fmt:formatNumber value="${product.price}" type="number"
                                                                    groupingUsed="true" />
                                                                <span
                                                                    style="font-size: 0.78rem; color: #818cf8;">₫</span>
                                                            </span>
                                                        </td>

                                                        <!-- Quantity -->
                                                        <td>
                                                            <span class="qty-tag ${product.quantity <= 5 ? 'low' : ''}">
                                                                ${product.quantity}
                                                                <c:if test="${product.quantity <= 5}">
                                                                    <i class="fas fa-exclamation-triangle ms-1"
                                                                        style="font-size: 0.7rem;"
                                                                        title="Sắp hết hàng"></i>
                                                                </c:if>
                                                            </span>
                                                        </td>

                                                        <!-- Sold -->
                                                        <td>
                                                            <span class="sold-tag">${product.sold}</span>
                                                        </td>

                                                        <!-- Actions -->
                                                        <td>
                                                            <div class="action-btn-group">
                                                                <a href="${pageContext.request.contextPath}/admin/product/update/${product.id}"
                                                                    class="btn-action btn-action-edit"
                                                                    title="Chỉnh sửa">
                                                                    <i class="fas fa-pen-to-square"></i> Sửa
                                                                </a>
                                                                <a href="${pageContext.request.contextPath}/admin/product/delete/${product.id}"
                                                                    class="btn-action btn-action-delete"
                                                                    title="Xóa sản phẩm">
                                                                    <i class="fas fa-trash"></i> Xóa
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                                <c:if test="${empty products}">
                                                    <tr>
                                                        <td colspan="7">
                                                            <div class="empty-products">
                                                                <i class="fas fa-box-open"></i>
                                                                <p>Chưa có sản phẩm nào. <a
                                                                        href="${pageContext.request.contextPath}/admin/product/create"
                                                                        style="color: #38bdf8;">Thêm ngay</a></p>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Table footer: count -->
                                    <div class="table-footer-bar">
                                        Tổng cộng: <strong>${not empty products ? products.size() : 0}</strong> sản phẩm
                                    </div>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                <a class="page-link" href="/admin/products?page=${currentPage - 1}"
                                                    aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach begin="0" end="${totalPages - 1}" var="page">
                                                <li class="page-item">
                                                    <a class="page-link ${(page + 1)eq currentPage ? 'active' : ''}"
                                                        href="/admin/products?page=${page + 1}">${page + 1}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                <a class="page-link" href="/admin/products?page=${currentPage + 1}"
                                                    aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>

                            </div><!-- end .page-content -->
                        </main>
                    </div><!-- end .dashboard-layout -->

                    <script src="/js/dashboard.js"></script>
                    <script>
                        function filterProducts() {
                            const input = document.getElementById('productSearch').value.toLowerCase();
                            const rows = document.querySelectorAll('#productTableBody .product-row');
                            rows.forEach(row => {
                                const text = row.innerText.toLowerCase();
                                row.style.display = text.includes(input) ? '' : 'none';
                            });
                        }
                    </script>
                </body>

                </html>
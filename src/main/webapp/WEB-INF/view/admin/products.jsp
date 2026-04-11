<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Home</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
                    crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
                    crossorigin="anonymous"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link rel="stylesheet" href="/css/dashboard.css">
            </head>

            <body>
                <div class="dashboard-layout">
                    <jsp:include page="../layout/sidebar.jsp" />

                    <main class="main-content">
                        <jsp:include page="../layout/header.jsp" />

                        <div class="page-content">
                            <div class="page-title-section">
                                <div>
                                    <h1>Quản lý sản phẩm</h1>
                                </div>
                                <div class="page-actions">
                                    <a href="${pageContext.request.contextPath}/admin/product/create"
                                        class="btn btn-primary"><i class="fas fa-plus"></i>
                                        Thêm sản phẩm</a>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <div class="row product-grid" id="productGrid">
                                        <c:forEach var="product" items="${products}">
                                            <div class="col-lg-3 col-md-6 mb-4">
                                                <div class="product-card glass-card h-100 d-flex flex-column"
                                                    style="box-shadow: 0 4px 6px rgba(0,0,0,0.1); border-radius: 8px; overflow: hidden; background: #fff;">
                                                    <div class="product-image"
                                                        style="position: relative; text-align: center; padding: 10px; cursor: pointer; min-height: 200px; display: flex; align-items: center; justify-content: center;">
                                                        <a
                                                            href="${pageContext.request.contextPath}/product/detail/${product.id}">
                                                            <img src="${not empty product.image ? '/images/product/'.concat(product.image) : 'https://via.placeholder.com/200?text=No+Image'}"
                                                                alt="${not empty product.name ? product.name : 'Sản phẩm'}"
                                                                style="max-height: 200px; object-fit: contain; width: 100%; transition: transform 0.3s;"
                                                                onerror="this.onerror=null;this.src='https://via.placeholder.com/200?text=No+Image';"
                                                                onmouseover="this.style.transform='scale(1.05)'"
                                                                onmouseout="this.style.transform='scale(1)'">
                                                        </a>
                                                    </div>
                                                    <div class="product-info d-flex flex-column"
                                                        style="padding: 15px; flex-grow: 1;">
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
                                                        <div
                                                            class="d-flex justify-content-end align-items-center mt-auto">
                                                            <a href="${pageContext.request.contextPath}/admin/product/update/${product.id}"
                                                                class="btn btn-sm btn-outline-warning me-2"
                                                                title="Sửa"><i class="fas fa-edit"></i> Sửa</a>
                                                            <a href="${pageContext.request.contextPath}/admin/product/delete/${product.id}"
                                                                class="btn btn-sm btn-outline-danger" title="Xóa"><i
                                                                    class="fas fa-trash"></i> Xóa</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div><!-- end .page-content -->
                    </main>
                </div><!-- end .dashboard-layout -->

                <script src="/js/dashboard.js"></script>
            </body>

            </html>
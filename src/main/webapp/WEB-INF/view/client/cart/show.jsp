<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Giỏ hàng | LaptopShop</title>

                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;700&display=swap"
                        rel="stylesheet">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
                        rel="stylesheet" crossorigin="anonymous">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/home.css">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/cart.css">
                </head>

                <body class="dark-theme">

                    <jsp:include page="../layout/header.jsp" />

                    <main class="cart-page">
                        <div class="container">

                            <!-- Page Title -->
                            <div class="cart-page-title">
                                <h1>Giỏ hàng của bạn
                                    <c:if test="${not empty cart}">
                                        <span class="cart-count-badge">${cart.sum} sản phẩm</span>
                                    </c:if>
                                </h1>
                                <a href="/" class="btn-back">
                                    <i class="fa-solid fa-arrow-left"></i> Tiếp tục mua sắm
                                </a>
                            </div>

                            <c:choose>
                                <%-- GIỎ HÀNG TRỐNG --%>
                                    <c:when test="${empty cartDetails}">
                                        <div class="cart-empty">
                                            <div class="cart-empty-icon">
                                                <i class="fa-solid fa-cart-xmark"></i>
                                            </div>
                                            <h3>Giỏ hàng của bạn đang trống</h3>
                                            <p>Hãy khám phá các sản phẩm và thêm vào giỏ hàng nhé!</p>
                                            <a href="/" class="btn-glow">
                                                <i class="fa-solid fa-store me-2"></i> Khám phá ngay
                                            </a>
                                        </div>
                                    </c:when>

                                    <%-- GIỎ HÀNG CÓ SẢN PHẨM --%>
                                        <c:otherwise>
                                            <div class="row g-4">
                                                <%-- DANH SÁCH SẢN PHẨM --%>
                                                    <div class="col-lg-8">
                                                        <div class="cart-items-card">
                                                            <c:forEach var="detail" items="${cartDetails}">
                                                                <div class="cart-item">
                                                                    <%-- Ảnh sản phẩm --%>
                                                                        <div class="cart-item-img">
                                                                            <a
                                                                                href="${pageContext.request.contextPath}/product/detail/${detail.products.id}">
                                                                                <img src="${not empty detail.products.image ? pageContext.request.contextPath.concat('/images/product/').concat(detail.products.image) : 'https://placehold.co/90x90/0f172a/38bdf8?text=N/A'}"
                                                                                    alt="${detail.products.name}"
                                                                                    onerror="this.onerror=null;this.src='https://placehold.co/90x90/0f172a/38bdf8?text=N/A';">
                                                                            </a>
                                                                        </div>
                                                                        <%-- Thông tin sản phẩm --%>
                                                                            <div class="cart-item-info">
                                                                                <a href="${pageContext.request.contextPath}/product/detail/${detail.products.id}"
                                                                                    class="cart-item-name">${detail.products.name}</a>
                                                                                <c:if
                                                                                    test="${not empty detail.products.factory}">
                                                                                    <span
                                                                                        class="cart-item-brand">${detail.products.factory}</span>
                                                                                </c:if>
                                                                                <div class="cart-item-unit-price">
                                                                                    Đơn giá:
                                                                                    <fmt:formatNumber
                                                                                        value="${detail.price}"
                                                                                        type="number"
                                                                                        groupingUsed="true" />
                                                                                    ₫
                                                                                </div>
                                                                            </div>
                                                                            <%-- Số lượng --%>
                                                                                <div class="cart-item-qty">
                                                                                    <span class="qty-label">Số
                                                                                        lượng</span>
                                                                                    <div
                                                                                        class="qty-control d-flex align-items-center">
                                                                                        <button
                                                                                            class="btn-qty btn-minus"
                                                                                            data-price="${detail.price}"><i
                                                                                                class="fa-solid fa-minus"></i></button>
                                                                                        <input type="text"
                                                                                            class="qty-val input-qty"
                                                                                            data-id="${detail.id}"
                                                                                            value="${detail.quantity}"
                                                                                            readonly>
                                                                                        <button class="btn-qty btn-plus"
                                                                                            data-price="${detail.price}"><i
                                                                                                class="fa-solid fa-plus"></i></button>
                                                                                    </div>
                                                                                </div>
                                                                                <%-- Thành tiền --%>
                                                                                    <div class="cart-item-subtotal">
                                                                                        <span
                                                                                            class="subtotal-label">Thành
                                                                                            tiền</span>
                                                                                        <span
                                                                                            class="subtotal-val item-subtotal"
                                                                                            data-price="${detail.price}">
                                                                                            <fmt:formatNumber
                                                                                                value="${detail.price * detail.quantity}"
                                                                                                type="number"
                                                                                                groupingUsed="true" />₫
                                                                                        </span>
                                                                                    </div>

                                                                                    <%-- Xoá --%>
                                                                                        <div class="cart-item-action">
                                                                                            <form method="post"
                                                                                                action="/delete-cart-product/${detail.id}">
                                                                                                <input type="hidden"
                                                                                                    name="${_csrf.parameterName}"
                                                                                                    value="${_csrf.token}" />
                                                                                                <button
                                                                                                    class="btn-remove-item"
                                                                                                    title="Xóa sản phẩm này">
                                                                                                    <i
                                                                                                        class="fa-solid fa-trash-can"></i>
                                                                                                </button>
                                                                                            </form>
                                                                                        </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>

                                                    <%-- ORDER SUMMARY --%>
                                                        <div class="col-lg-4">
                                                            <div class="cart-summary-card">
                                                                <h4 class="summary-title">
                                                                    <i class="fa-solid fa-receipt me-2"></i> Tóm tắt đơn
                                                                    hàng
                                                                </h4>

                                                                <div class="summary-rows">
                                                                    <div class="summary-row">
                                                                        <span>Tạm tính (<span
                                                                                id="cart-total-items">${cart.sum}</span>
                                                                            sản
                                                                            phẩm)</span>
                                                                        <span id="cart-subtotal-price">
                                                                            <fmt:formatNumber value="${totalPrice}"
                                                                                type="number" groupingUsed="true" />₫
                                                                        </span>
                                                                    </div>
                                                                    <div class="summary-row">
                                                                        <span>Phí vận chuyển</span>
                                                                        <span class="text-success">Miễn phí</span>
                                                                    </div>
                                                                    <div class="summary-row summary-row-total">
                                                                        <span>Tổng cộng</span>
                                                                        <span class="total-price" id="cart-total-price">
                                                                            <fmt:formatNumber value="${totalPrice}"
                                                                                type="number" groupingUsed="true" />₫
                                                                        </span>
                                                                    </div>
                                                                    <form:form action="/confirm-checkout" method="post"
                                                                        modelAttribute="cart">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" />
                                                                        <div style="display: none;">
                                                                            <c:forEach var="detail"
                                                                                items="${cart.cartDetails}"
                                                                                varStatus="status">
                                                                                <div class="mb-3">
                                                                                    <div class="form-group">
                                                                                        <form:input
                                                                                            path="cartDetails[${status.index}].id"
                                                                                            type="text"
                                                                                            value="${detail.id}" />
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <form:input
                                                                                            path="cartDetails[${status.index}].quantity"
                                                                                            type="text"
                                                                                            cssClass="hidden-qty"
                                                                                            data-id="${detail.id}"
                                                                                            value="${detail.quantity}" />
                                                                                    </div>
                                                                                </div>

                                                                            </c:forEach>
                                                                        </div>
                                                                        
                                                                        <button type="submit" class="btn-checkout">
                                                                            <i class="fa-solid fa-lock me-2"></i> Tiến hành
                                                                            thanh toán
                                                                        </button>
                                                                    </form:form>
                                                                </div>

                                                                <div class="summary-policy">
                                                                    <i class="fa-solid fa-shield-halved"></i> Thanh toán
                                                                    an
                                                                    toàn &amp; bảo mật
                                                                </div>
                                                            </div>
                                                        </div>

                                            </div>
                                        </c:otherwise>
                            </c:choose>

                        </div>
                    </main>

                    <jsp:include page="../layout/footer.jsp" />

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <script src="${pageContext.request.contextPath}/client/js/home.js"></script>
                    <script src="${pageContext.request.contextPath}/client/js/cart.js"></script>
                </body>

                </html>
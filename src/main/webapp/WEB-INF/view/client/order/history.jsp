<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Lịch sử đơn hàng - LaptopShop</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
                        rel="stylesheet" crossorigin="anonymous">
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/home.css">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/cart.css">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/history.css">
                </head>

                <body class="dark-theme">
                    <jsp:include page="../layout/header.jsp" />

                    <main class="history-page">
                        <div class="container">
                            <div class="d-flex align-items-center mb-4">
                                <h1 style="color: #fff; font-weight: 700;"><i
                                        class="fa-solid fa-clock-rotate-left me-2"></i>Lịch sử đặt hàng</h1>
                            </div>

                            <c:choose>
                                <c:when test="${empty orders}">
                                    <div class="text-center py-5">
                                        <i class="fa-solid fa-box-open"
                                            style="font-size: 80px; margin-bottom: 20px; color: rgba(255,255,255,0.1);"></i>
                                        <h3 style="color: #fff; font-weight: 600;">Chưa có đơn hàng nào</h3>
                                        <p style="color: var(--text-secondary); margin-bottom: 30px;">Bạn chưa thực hiện
                                            giao dịch nào. Hãy khám phá các sản phẩm của chúng tôi!</p>
                                        <a href="/products" class="btn btn-secondary primary-btn text-decoration-none"
                                            style="padding: 12px 25px; border-radius: 12px;">Mua sắm ngay</a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="row justify-content-center">
                                        <div class="col-lg-10">
                                            <c:forEach var="order" items="${orders}">
                                                <div class="order-card">
                                                    <div class="order-card-header">
                                                        <div class="order-id">Đơn hàng #${order.id}</div>
                                                        <div class="order-status status-${order.status}">
                                                            <c:choose>
                                                                <c:when test="${order.status == 'PENDING'}">Đang chờ xử
                                                                    lý</c:when>
                                                                <c:when test="${order.status == 'SHIPPING'}">Đang giao
                                                                </c:when>
                                                                <c:when test="${order.status == 'DELIVERED'}">Đã giao
                                                                </c:when>
                                                                <c:when test="${order.status == 'CANCELED'}">Đã hủy
                                                                </c:when>
                                                                <c:otherwise>${order.status}</c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>

                                                    <div class="order-info row">
                                                        <div class="col-md-6 mb-2">
                                                            <div><strong>Người nhận:</strong> ${order.receiverName}
                                                            </div>
                                                            <div><strong>SĐT:</strong> ${order.receiverPhone}</div>
                                                        </div>
                                                        <div class="col-md-6 mb-2">
                                                            <div><strong>Địa chỉ:</strong> ${order.receiverAddress}
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="order-items">
                                                        <c:forEach var="detail" items="${order.orderDetails}">
                                                            <div class="history-item">
                                                                <div class="history-img-wrapper">
                                                                    <a href="/product/detail/${detail.product.id}">
                                                                        <img src="${not empty detail.product.image ? pageContext.request.contextPath.concat('/images/product/').concat(detail.product.image) : 'https://placehold.co/90x90/0f172a/38bdf8?text=N/A'}"
                                                                            alt="${detail.product.name}"
                                                                            onerror="this.onerror=null;this.src='https://placehold.co/90x90/0f172a/38bdf8?text=N/A';">
                                                                    </a>
                                                                    <span
                                                                        class="history-item-qty">${detail.quantity}</span>
                                                                </div>
                                                                <div class="history-item-info">
                                                                    <a href="/product/detail/${detail.product.id}"
                                                                        class="history-item-name text-decoration-none">${detail.product.name}</a>
                                                                    <div class="history-item-price">
                                                                        <fmt:formatNumber value="${detail.price}"
                                                                            type="number" groupingUsed="true" />₫
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>

                                                    <div class="order-total-bar">
                                                        <div class="total-label">Tổng tiền</div>
                                                        <div class="total-value">
                                                            <fmt:formatNumber value="${order.totalPrice}" type="number"
                                                                groupingUsed="true" />₫
                                                        </div>
                                                    </div>
                                                    
                                                    <c:if test="${order.status eq 'PENDING'}">
                                                        <div class="mt-3 text-end">
                                                            <form action="/cancel-order/${order.id}" method="post" style="display:inline;">
                                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                                <button type="submit" class="btn btn-outline-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn hủy đơn hàng này không?');">Hủy đơn hàng</button>
                                                            </form>
                                                        </div>
                                                    </c:if>

                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </main>

                    <jsp:include page="../layout/footer.jsp" />

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                </body>

                </html>
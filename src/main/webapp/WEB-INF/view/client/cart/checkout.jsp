<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán | LaptopShop</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/checkout.css">
</head>

<body class="dark-theme">

    <jsp:include page="../layout/header.jsp" />

    <main class="checkout-page">
        <div class="container">

            <div class="checkout-page-title">
                <h1>Thanh toán đơn hàng</h1>
                <a href="${pageContext.request.contextPath}/cart" class="btn-back">
                    <i class="fa-solid fa-arrow-left"></i> Quay lại giỏ hàng
                </a>
            </div>

            <form action="/place-order" method="post" id="checkoutForm">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div class="row g-4">
                    
                    <!-- LEFT COL: FORM NHẬP THÔNG TIN -->
                    <div class="col-lg-7">
                        <div class="checkout-card">
                            <h3 class="checkout-card-title"><i class="fa-regular fa-address-card me-2"></i>Thông tin nhận hàng</h3>
                            
                            <div class="checkout-form-group">
                                <label for="receiverName" class="form-label">Họ và tên người nhận <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="receiverName" name="fullName" value="${cart.user.fullName}" placeholder="Nhập họ và tên đầy đủ" required>
                            </div>

                            <div class="checkout-form-row">
                                <div class="checkout-form-group">
                                    <label for="receiverPhone" class="form-label">Số điện thoại <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="receiverPhone" name="phone" value="${cart.user.phone}" placeholder="Ví dụ: 0912345678" required>
                                </div>
                                <div class="checkout-form-group">
                                    <label for="receiverEmail" class="form-label">Ghi chú thêm</label>
                                    <input type="text" class="form-control" id="note" name="note" placeholder="Nhập ghi chú cho đơn hàng (tuỳ chọn)">
                                </div>
                            </div>

                            <div class="checkout-form-group">
                                <label for="receiverAddress" class="form-label">Địa chỉ giao hàng chi tiết <span class="text-danger">*</span></label>
                                <textarea class="form-control" id="receiverAddress" name="address" placeholder="Nhập số nhà, tên đường, phường/xã, quận/huyện, tỉnh/thành phố..." required>${cart.user.address}</textarea>
                            </div>
                        </div>
                    </div>

                    <!-- RIGHT COL: THÔNG TIN ĐƠN HÀNG TÓM TẮT -->
                    <div class="col-lg-5">
                        <div class="checkout-card">
                            <h3 class="checkout-card-title"><i class="fa-solid fa-box-open me-2"></i>Đơn hàng của bạn</h3>
                            
                            <!-- Danh sách sản phẩm -->
                            <div class="order-items-list">
                                <c:forEach var="detail" items="${cartDetails}">
                                    <div class="mini-cart-item">
                                        <div class="mini-img-wrapper">
                                            <a href="${pageContext.request.contextPath}/product/detail/${detail.products.id}">
                                                <img src="${not empty detail.products.image ? pageContext.request.contextPath.concat('/images/product/').concat(detail.products.image) : 'https://placehold.co/90x90/0f172a/38bdf8?text=N/A'}" 
                                                     alt="${detail.products.name}"
                                                     style="width: 55px; height: 55px; object-fit: contain;"
                                                     onerror="this.onerror=null;this.src='https://placehold.co/90x90/0f172a/38bdf8?text=N/A';">
                                            </a>
                                            <span class="mini-item-qty">${detail.quantity}</span>
                                        </div>
                                        <div class="mini-item-info">
                                            <a href="${pageContext.request.contextPath}/product/detail/${detail.products.id}" class="mini-item-name text-decoration-none">
                                                ${detail.products.name}
                                            </a>
                                            <div class="mini-item-price">
                                                <fmt:formatNumber value="${detail.price}" type="number" groupingUsed="true" />₫
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- Tính tổng tiền -->
                            <div class="order-totals">
                                <div class="total-row">
                                    <span>Tạm tính</span>
                                    <span><fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true" />₫</span>
                                </div>
                                <div class="total-row">
                                    <span>Phí vận chuyển</span>
                                    <span class="text-success">Miễn phí</span>
                                </div>
                                <div class="total-row final-total">
                                    <span>Tổng số tiền</span>
                                    <span class="total-val"><fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true" />₫</span>
                                </div>
                            </div>

                            <button type="submit" class="btn-place-order">
                                <i class="fa-solid fa-check-circle"></i> Đặt hàng ngay
                            </button>
                            
                        </div>
                    </div>
                    
                </div>
            </form>
        </div>
    </main>

    <jsp:include page="../layout/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>

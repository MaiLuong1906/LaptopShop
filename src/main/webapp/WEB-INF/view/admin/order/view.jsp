<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đơn hàng - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="/css/dashboard.css">
</head>
<body>
    <div class="dashboard-layout">
        <jsp:include page="../../layout/sidebar.jsp" />
        <main class="main-content">
            <jsp:include page="../../layout/header.jsp" />
            <div class="page-content">
                <div class="page-title-section">
                    <div><h1>Chi tiết đơn hàng #${order.id}</h1></div>
                    <div class="page-actions"><a href="/admin/orders" class="btn btn-secondary">Quay lại</a></div>
                </div>
                
                <div class="card mb-4">
                    <div class="card-body">
                        <h5>Thông tin người nhận</h5>
                        <div class="row mt-3">
                            <div class="col-md-6"><p><strong>Tên:</strong> ${order.receiverName}</p></div>
                            <div class="col-md-6"><p><strong>SĐT:</strong> ${order.receiverPhone}</p></div>
                            <div class="col-md-12"><p><strong>Địa chỉ:</strong> ${order.receiverAddress}</p></div>
                            <div class="col-md-6"><p><strong>Trạng thái:</strong> <span class="badge bg-primary">${order.status}</span></p></div>
                            <div class="col-md-6"><p><strong>Tổng tiền:</strong> <fmt:formatNumber value="${order.totalPrice}" type="number" groupingUsed="true" />₫</p></div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h5>Danh sách sản phẩm</h5>
                        <table class="data-table mt-3">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Sản phẩm</th>
                                    <th>Đơn giá</th>
                                    <th>Số lượng</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="detail" items="${order.orderDetails}">
                                    <tr>
                                        <td>${detail.product.id}</td>
                                        <td>${detail.product.name}</td>
                                        <td><fmt:formatNumber value="${detail.price}" type="number" groupingUsed="true" />₫</td>
                                        <td>${detail.quantity}</td>
                                        <td><fmt:formatNumber value="${detail.price * detail.quantity}" type="number" groupingUsed="true" />₫</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>

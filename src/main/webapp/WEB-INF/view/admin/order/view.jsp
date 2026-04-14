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
                    <div class="card-body" style="color: #cbd5e1;">
                        <h5 style="color: #f8fafc; font-weight: 600;"><i class="fas fa-address-card me-2" style="color: #38bdf8;"></i> Thông tin người nhận</h5>
                        <div class="row mt-4">
                            <div class="col-md-6 mb-3"><p class="mb-1"><strong style="color: #f8fafc; font-weight: 500;">Tên:</strong> ${order.receiverName}</p></div>
                            <div class="col-md-6 mb-3"><p class="mb-1"><strong style="color: #f8fafc; font-weight: 500;">SĐT:</strong> ${order.receiverPhone}</p></div>
                            <div class="col-md-12 mb-3"><p class="mb-1"><strong style="color: #f8fafc; font-weight: 500;">Địa chỉ:</strong> ${order.receiverAddress}</p></div>
                            <div class="col-md-6 mb-3">
                                <p class="mb-1"><strong style="color: #f8fafc; font-weight: 500;">Trạng thái:</strong> 
                                    <span class="badge ${order.status == 'PENDING' ? 'bg-warning text-dark' : (order.status == 'SHIPPING' ? 'bg-info text-dark' : (order.status == 'DELIVERED' ? 'bg-success' : 'bg-danger'))} px-2 py-1">${order.status}</span>
                                </p>
                            </div>
                            <div class="col-md-6 mb-3"><p class="mb-1"><strong style="color: #f8fafc; font-weight: 500;">Tổng tiền:</strong> <span style="color: #fbbf24; font-weight: 600;"><fmt:formatNumber value="${order.totalPrice}" type="number" groupingUsed="true" />₫</span></p></div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h5 style="color: #f8fafc; font-weight: 600; margin-bottom: 20px;"><i class="fas fa-list-ul me-2" style="color: #38bdf8;"></i> Danh sách sản phẩm</h5>
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

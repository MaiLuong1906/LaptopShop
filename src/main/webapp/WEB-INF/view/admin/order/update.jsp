<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật đơn hàng</title>
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
                    <div><h1>Cập nhật trạng thái đơn hàng #${order.id}</h1></div>
                    <div class="page-actions"><a href="/admin/orders" class="btn btn-secondary">Quay lại</a></div>
                </div>
                
                <div class="card" style="max-width: 600px;">
                    <div class="card-body">
                        <form:form action="/admin/orders/update" method="post" modelAttribute="order">
                            <form:hidden path="id" />
                            
                            <div class="mb-3">
                                <label class="form-label">Tên người nhận</label>
                                <input type="text" class="form-control" value="${order.receiverName}" disabled>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label">Cập nhật trạng thái</label>
                                <form:select path="status" class="form-select">
                                    <form:option value="PENDING" label="Đang chờ xử lý (PENDING)"/>
                                    <form:option value="SHIPPING" label="Đang giao (SHIPPING)"/>
                                    <form:option value="DELIVERED" label="Đã giao (DELIVERED)"/>
                                    <form:option value="CANCELED" label="Đã hủy (CANCELED)"/>
                                </form:select>
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>

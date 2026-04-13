<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xóa đơn hàng</title>
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
                    <div><h1>Xác nhận xóa đơn hàng #${order.id}</h1></div>
                    <div class="page-actions"><a href="/admin/orders" class="btn btn-secondary">Quay lại</a></div>
                </div>
                
                <div class="card" style="max-width: 600px;">
                    <div class="card-body">
                        <div class="alert alert-danger">
                            <i class="fas fa-exclamation-triangle"></i> Bạn có chắc chắn muốn xóa đơn hàng của <strong>${order.receiverName}</strong> không? Hình thức này sẽ xóa toàn bộ chi tiết đơn đặt hàng bên trong, hành động này không thể hoàn tác!
                        </div>
                        <form:form action="/admin/orders/delete" method="post" modelAttribute="order">
                            <form:hidden path="id" />
                            <button type="submit" class="btn btn-danger">Xác nhận xóa</button>
                            <a href="/admin/orders" class="btn btn-secondary ms-2">Hủy bỏ</a>
                        </form:form>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>

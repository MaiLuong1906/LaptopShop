<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Quản lý đơn hàng</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
                    crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
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
                                <div>
                                    <h1>Quản lý đơn hàng</h1>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <table class="data-table">
                                        <thead>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Người nhận (Tên/SĐT)</th>
                                                <th scope="col">Tổng tiền</th>
                                                <th scope="col">Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="order" items="${orders}">
                                                <tr>
                                                    <td>${order.id}</td>
                                                    <td>${order.receiverName} <br><small
                                                            class="text-muted">${order.receiverPhone}</small></td>
                                                    <td>
                                                        <fmt:formatNumber value="${order.totalPrice}" type="number"
                                                            groupingUsed="true" />₫
                                                    </td>
                                                    <td>
                                                        <span
                                                            class="badge ${order.status == 'PENDING' ? 'bg-warning' : (order.status == 'SHIPPING' ? 'bg-info' : (order.status == 'DELIVERED' ? 'bg-success' : 'bg-danger'))}">
                                                            ${order.status}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <a href="${pageContext.request.contextPath}/admin/orders/view/${order.id}"
                                                            class="btn btn-sm btn-primary"><i class="fas fa-eye"></i>
                                                            Xem</a>
                                                        <a href="${pageContext.request.contextPath}/admin/orders/update/${order.id}"
                                                            class="btn btn-sm btn-warning"><i class="fas fa-edit"></i>
                                                            Sửa trạng thái</a>
                                                        <a href="${pageContext.request.contextPath}/admin/orders/delete/${order.id}"
                                                            class="btn btn-sm btn-danger"><i class="fas fa-trash"></i>
                                                            Xóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                <a class="page-link" href="/admin/orders?page=${currentPage - 1}"
                                                    aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach begin="0" end="${totalPages - 1}" var="page">
                                                <li class="page-item">
                                                    <a class="page-link ${(page + 1)eq currentPage ? 'active' : ''}"
                                                        href="/admin/orders?page=${page + 1}">${page + 1}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                <a class="page-link" href="/admin/orders?page=${currentPage + 1}"
                                                    aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div><!-- end .page-content -->
                    </main>
                </div><!-- end .dashboard-layout -->

                <script src="/js/dashboard.js"></script>
            </body>

            </html>
<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Thêm sản phẩm</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
                    crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
                    crossorigin="anonymous"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link rel="stylesheet" href="/css/dashboard.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body>
                <div class="dashboard-layout">
                    <jsp:include page="../../layout/sidebar.jsp" />

                    <main class="main-content">
                        <jsp:include page="../../layout/header.jsp" />

                        <div class="page-content">
                            <div class="page-title-section">
                                <div>
                                    <h1>Tạo mới sản phẩm</h1>
                                </div>
                            </div>
                            <div class="card" style="max-width: 800px; margin: 0 auto;">
                                <div class="card-body">
                                    <form:form method="post" action="/admin/product/create" modelAttribute="product"
                                        enctype="multipart/form-data">

                                        <div class="row">
                                            <div class="mb-3 col-md-6">
                                                <c:set var="nameError">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="name" class="form-label">Tên sản phẩm:</label>
                                                <form:input path="name" id="name" type="text"
                                                    class="form-control ${not empty nameError ? 'is-invalid' : ''}" />
                                                ${nameError}
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <c:set var="priceError">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="price" class="form-label">Giá (VND):</label>
                                                <form:input path="price" id="price" type="number"
                                                    class="form-control ${not empty priceError ? 'is-invalid' : ''}" />
                                                ${priceError}
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="mb-3 col-md-6">
                                                <c:set var="quantityError">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="quantity" class="form-label">Số lượng:</label>
                                                <form:input path="quantity" id="quantity" type="number"
                                                    class="form-control ${not empty quantityError ? 'is-invalid' : ''}" />
                                                ${quantityError}
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="factory" class="form-label">Hãng sản xuất:</label>
                                                <form:select class="form-select" path="factory">
                                                    <form:option value="Apple">Apple</form:option>
                                                    <form:option value="Asus">Asus</form:option>
                                                    <form:option value="Dell">Dell</form:option>
                                                    <form:option value="Lenovo">Lenovo</form:option>
                                                    <form:option value="Acer">Acer</form:option>
                                                    <form:option value="HP">HP</form:option>
                                                </form:select>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label for="target" class="form-label">Mục đích sử dụng:</label>
                                            <form:select class="form-select" path="target">
                                                <form:option value="Gaming">Gaming</form:option>
                                                <form:option value="Sinh viên - Văn phòng">Sinh viên - Văn phòng
                                                </form:option>
                                                <form:option value="Thiết kế đồ họa">Thiết kế đồ họa</form:option>
                                                <form:option value="Mỏng nhẹ">Mỏng nhẹ</form:option>
                                                <form:option value="Doanh nhân">Doanh nhân</form:option>
                                            </form:select>
                                        </div>

                                        <div class="mb-3">
                                            <label for="shortDesc" class="form-label">Mô tả ngắn gọn:</label>
                                            <form:input path="shortDesc" id="shortDesc" type="text"
                                                class="form-control" />
                                        </div>

                                        <div class="mb-3">
                                            <label for="detailDecs" class="form-label">Mô tả chi tiết:</label>
                                            <form:textarea path="detailDecs" id="detailDecs" class="form-control"
                                                rows="4" />
                                        </div>

                                        <div class="mb-3">
                                            <label for="avatarFile" class="form-label">Hình ảnh sản phẩm:</label>
                                            <input class="form-control" type="file" id="avatarFile"
                                                accept=".png, .jpg, .jpeg" name="file" />
                                        </div>
                                        <div class="mb-3">
                                            <img style="display: none; max-height: 250px;" id="avatarPreview"
                                                alt="Product Preview" />
                                        </div>

                                        <div class="text-end">
                                            <a href="/admin/products" class="btn btn-secondary me-2">Hủy</a>
                                            <button type="submit" class="btn btn-primary">Tạo sản phẩm</button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>

                        </div><!-- end .page-content -->
                    </main>
                </div><!-- end .dashboard-layout -->

                <script src="/js/dashboard.js"></script>
            </body>

            </html>
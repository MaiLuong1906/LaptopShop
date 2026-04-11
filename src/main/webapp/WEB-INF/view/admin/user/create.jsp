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
                                    <h1>Tạo mới người dùng</h1>
                                </div>
                            </div>
                            <div class="card" style="max-width: 600px; margin: 0 auto;">
                                <div class="card-body">
                                    <form:form method="post" action="/admin/users/create" modelAttribute="user"
                                        enctype="multipart/form-data">
                                        <div class="mb-3">
                                            <c:set var="emailError"><form:errors path="email" cssClass="invalid-feedback" /></c:set>
                                            <label for="email" class="form-label">Email:</label>
                                            <form:input path="email" id="email" type="email"
                                                class="form-control ${not empty emailError ? 'is-invalid' : ''}"
                                                placeholder="Nhập email..." />
                                            ${emailError}
                                        </div>
                                        <div class="mb-3">
                                            <c:set var="passwordError"><form:errors path="password" cssClass="invalid-feedback" /></c:set>
                                            <label for="password" class="form-label">Mật khẩu:</label>
                                            <form:password path="password" id="password"
                                                class="form-control ${not empty passwordError ? 'is-invalid' : ''}"
                                                placeholder="••••••••" />
                                            ${passwordError}
                                        </div>
                                        <div class="mb-3">
                                            <c:set var="fullNameError"><form:errors path="fullName" cssClass="invalid-feedback" /></c:set>
                                            <label for="fullName" class="form-label">Họ và tên:</label>
                                            <form:input path="fullName" id="fullName" type="text"
                                                class="form-control ${not empty fullNameError ? 'is-invalid' : ''}"
                                                placeholder="Nguyễn Văn A" />
                                            ${fullNameError}
                                        </div>
                                        <div class="mb-3">
                                            <label for="address" class="form-label">Địa chỉ:</label>
                                            <form:input path="address" id="address" type="text" class="form-control"
                                                placeholder="Số nhà, tên đường..." />
                                        </div>
                                        <div class="mb-3">
                                            <label for="phone" class="form-label">Số điện thoại:</label>
                                            <form:input path="phone" id="phone" type="text" class="form-control"
                                                placeholder="09xxxxxxxx" />
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <form:select class="form-select" aria-label="Default select example"
                                                path="role.name">
                                                <form:option value="ADMIN">Admin</form:option>
                                                <form:option value="USER">User</form:option>
                                            </form:select>
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <label for="avatarFile" class="form-label">Avatar</label>
                                            <input class="form-control" type="file" id="avatarFile"
                                                accept=".png, .jpg, .jpeg" name="file" />
                                        </div>
                                        <div class="mb-3 col-12">
                                            <img style="display: none; max-height: 250px;" id="avatarPreview"
                                                alt="Avatar Preview" />
                                        </div>
                                        <div class="text-end">
                                            <a href="/admin/users" class="btn btn-secondary me-2">Hủy</a>
                                            <button type="submit" class="btn btn-primary">Tạo người dùng</button>
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
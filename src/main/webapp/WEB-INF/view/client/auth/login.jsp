<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Login</title>

                <!-- Bootstrap CSS (if you use it globally) -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
                    crossorigin="anonymous">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            </head>

            <body>
                <form method="post" action="/login">
                    <c:if test="${param.error!=null}">
                        <div class="alert alert-danger" role="alert">
                            Invalid username or password.
                        </div>
                    </c:if>
                    <div class="mb-3">
                        <label>Email</label>
                        <input type="email" name="username" cssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Password</label>
                        <input type="password" name="password" cssClass="form-control" />
                    </div>
                    <div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </div>
                    <button type="submit" class="btn btn-primary">Login</button>
            </body>

            </html>
<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Register</title>

                <!-- Bootstrap CSS (if you use it globally) -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
                    crossorigin="anonymous">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            </head>

            <body>
                <h1>Register</h1>
                <form:form method="post" modelAttribute="registerUser"
                    action="${pageContext.request.contextPath}/register">
                    <c:set var="confirmPasswordError">
                        <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                    </c:set>
                    <c:set var="emailError">
                        <form:errors path="email" cssClass="invalid-feedback" />
                    </c:set>
                    <div class="mb-3">
                        <form:label path="firstName">First Name</form:label>
                        <form:input path="firstName" cssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <form:label path="lastName">Last Name</form:label>
                        <form:input path="lastName" cssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <form:label path="email">Email</form:label>
                        <form:input path="email" class="form-control ${not empty emailError ? 'is-invalid' : ''}" />
                        ${emailError}
                    </div>
                    <div class="mb-3">
                        <form:label path="password">Password</form:label>
                        <form:password path="password" cssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <form:label path="confirmPassword">Confirm Password</form:label>
                        <form:password path="confirmPassword"
                            class="form-control ${not empty confirmPasswordError ? 'is-invalid' : ''}" />
                        ${confirmPasswordError}
                    </div>
                    <button type="submit" class="btn btn-primary">Register</button>
                </form:form>
            </body>

            </html>
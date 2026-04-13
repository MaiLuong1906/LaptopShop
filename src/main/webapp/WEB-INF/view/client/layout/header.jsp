<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<header class="glass-header">
    <div class="container d-flex justify-content-between align-items-center py-3">
        <a href="/" class="brand-link text-decoration-none">
            <h2 class="brand-logo"><i class="fa-brands fa-space-awesome text-gradient"></i> LaptopShop</h2>
        </a>
        <nav class="nav-links">
            <a href="/" class="active">Home</a>
            <a href="/products">Products</a>
            <a href="/about">About</a>
            <a href="/contact">Contact</a>
        </nav>
        <div class="user-actions d-flex align-items-center gap-3">

            <%-- Biểu tượng giỏ hàng với badge số lượng --%>
            <a href="/cart" class="btn-icon cart-icon-wrap">
                <i class="fa-solid fa-cart-shopping"></i>
                <c:if test="${not empty sessionScope.cartSum and sessionScope.cartSum > 0}">
                    <span class="cart-badge">${sessionScope.cartSum}</span>
                </c:if>
            </a>

            <c:choose>
                <c:when test="${not empty pageContext.request.userPrincipal}">
                    <div class="dropdown">
                        <a class="btn-gradient dropdown-toggle text-decoration-none" href="#" role="button"
                           id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false"
                           style="display: inline-flex; align-items: center; gap: 8px;">
                            <i class="fa-regular fa-circle-user" style="font-size: 1.2rem;"></i>
                            <span>${pageContext.request.userPrincipal.name}</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="userDropdown"
                            style="background: rgba(30, 30, 35, 0.95); border: 1px solid rgba(255,255,255,0.1); border-radius: 12px; backdrop-filter: blur(10px);">
                            <li><a class="dropdown-item text-white" href="#"
                                   onmouseover="this.style.background='rgba(255,255,255,0.1)'"
                                   onmouseout="this.style.background='transparent'">
                                <i class="fa-solid fa-id-badge me-2"></i> Profile</a></li>
                            <li><a class="dropdown-item text-white" href="${pageContext.request.contextPath}/order-history"
                                   onmouseover="this.style.background='rgba(255,255,255,0.1)'"
                                   onmouseout="this.style.background='transparent'">
                                <i class="fa-solid fa-clipboard-list me-2"></i> Lịch sử đơn hàng</a></li>
                            <li><hr class="dropdown-divider" style="border-color: rgba(255, 255, 255, 0.1);"></li>
                            <li>
                                <form method="post" action="/logout" class="m-0 p-0 text-white">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <button type="submit" class="dropdown-item text-white"
                                            onmouseover="this.style.background='rgba(255,255,255,0.1)'"
                                            onmouseout="this.style.background='transparent'">
                                        <i class="fa-solid fa-right-from-bracket me-2 text-danger"></i> Logout
                                    </button>
                                </form>
                            </li>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="/login" class="btn-gradient">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>
/**
 * LaptopShop Admin Dashboard - Main JavaScript
 * Handles navigation, data rendering, modals, toasts, and interactivity
 */

document.addEventListener('DOMContentLoaded', () => {
    initNavigation();
    initSidebar();
    initHeader();
    renderRevenueChart();
    renderProductsTable();
    renderOrdersTable();
    renderUsersTable();
    renderRolesTable();
    initModals();
    initFilters();

    // Welcome toast
    setTimeout(() => {
        showToast('success', 'Chào mừng trở lại!', 'Dashboard đã sẵn sàng.');
    }, 800);
});

// ==========================================
// ===== SAMPLE DATA ======================
// ==========================================

const productsData = [
    { id: 1, name: 'Dell XPS 15 9530', shortDesc: 'Intel i7-13700H, 16GB RAM, 512GB SSD', price: 35990000, quantity: 45, sold: 156, factory: 'Dell', target: 'Đồ hoạ', image: '' },
    { id: 2, name: 'MacBook Pro 14 M3', shortDesc: 'Apple M3 Pro, 18GB RAM, 512GB SSD', price: 45990000, quantity: 30, sold: 134, factory: 'Apple', target: 'Đồ hoạ', image: '' },
    { id: 3, name: 'ASUS ROG Strix G16', shortDesc: 'Intel i9-13980HX, RTX 4070, 16GB', price: 28990000, quantity: 22, sold: 98, factory: 'Asus', target: 'Gaming', image: '' },
    { id: 4, name: 'HP Pavilion 15-eg3000', shortDesc: 'Intel i5-1335U, 8GB RAM, 256GB SSD', price: 15490000, quantity: 3, sold: 87, factory: 'HP', target: 'Sinh viên', image: '' },
    { id: 5, name: 'Lenovo ThinkPad X1 Carbon Gen 11', shortDesc: 'Intel i7-1365U, 16GB RAM, 512GB SSD', price: 32990000, quantity: 18, sold: 76, factory: 'Lenovo', target: 'Văn phòng', image: '' },
    { id: 6, name: 'Acer Nitro 5 AN515-58', shortDesc: 'Intel i5-12500H, RTX 3050, 8GB', price: 19990000, quantity: 55, sold: 65, factory: 'Acer', target: 'Gaming', image: '' },
    { id: 7, name: 'MSI GF63 Thin 12UC', shortDesc: 'Intel i5-12450H, RTX 3050, 8GB', price: 17490000, quantity: 40, sold: 54, factory: 'MSI', target: 'Gaming', image: '' },
    { id: 8, name: 'Dell Inspiron 16 5630', shortDesc: 'Intel i7-1360P, 16GB RAM, 512GB SSD', price: 22990000, quantity: 35, sold: 48, factory: 'Dell', target: 'Văn phòng', image: '' },
    { id: 9, name: 'HP Envy x360 15', shortDesc: 'AMD Ryzen 7 7730U, 16GB RAM, 512GB SSD', price: 24990000, quantity: 28, sold: 42, factory: 'HP', target: 'Đồ hoạ', image: '' },
    { id: 10, name: 'Lenovo IdeaPad Gaming 3', shortDesc: 'AMD Ryzen 5 6600H, RTX 3050, 8GB', price: 16990000, quantity: 60, sold: 38, factory: 'Lenovo', target: 'Gaming', image: '' },
];

const ordersData = [
    { id: 'ORD-2841', customer: 'Nguyễn Văn A', email: 'nguyenvana@email.com', totalPrice: 25990000, status: 'Hoàn thành', date: '10/04/2026' },
    { id: 'ORD-2840', customer: 'Trần Thị B', email: 'tranthib@email.com', totalPrice: 18500000, status: 'Đang giao', date: '10/04/2026' },
    { id: 'ORD-2839', customer: 'Lê Hoàng C', email: 'lehoangc@email.com', totalPrice: 32400000, status: 'Xử lý', date: '09/04/2026' },
    { id: 'ORD-2838', customer: 'Phạm Đức D', email: 'phamducd@email.com', totalPrice: 45000000, status: 'Hoàn thành', date: '09/04/2026' },
    { id: 'ORD-2837', customer: 'Võ Ngọc E', email: 'vongoce@email.com', totalPrice: 15200000, status: 'Đã hủy', date: '08/04/2026' },
    { id: 'ORD-2836', customer: 'Hoàng Anh G', email: 'hoanganhg@email.com', totalPrice: 35990000, status: 'Hoàn thành', date: '08/04/2026' },
    { id: 'ORD-2835', customer: 'Trần Minh F', email: 'tranminhf@email.com', totalPrice: 28990000, status: 'Đang giao', date: '07/04/2026' },
    { id: 'ORD-2834', customer: 'Nguyễn Thị H', email: 'nguyenthih@email.com', totalPrice: 19990000, status: 'Hoàn thành', date: '07/04/2026' },
    { id: 'ORD-2833', customer: 'Lý Văn I', email: 'lyvani@email.com', totalPrice: 22990000, status: 'Xử lý', date: '06/04/2026' },
    { id: 'ORD-2832', customer: 'Đỗ Kim K', email: 'dokimk@email.com', totalPrice: 45990000, status: 'Hoàn thành', date: '06/04/2026' },
];

const usersData = [
    { id: 1, fullName: 'Nguyễn Văn A', email: 'nguyenvana@email.com', phone: '0901234567', address: '123 Nguyễn Huệ, Q.1, TP.HCM', role: 'USER', orders: 5, avatar: '' },
    { id: 2, fullName: 'Trần Thị B', email: 'tranthib@email.com', phone: '0912345678', address: '456 Lê Lợi, Q.3, TP.HCM', role: 'USER', orders: 3, avatar: '' },
    { id: 3, fullName: 'Lê Hoàng C', email: 'lehoangc@email.com', phone: '0923456789', address: '789 Hai Bà Trưng, Q.1, TP.HCM', role: 'USER', orders: 8, avatar: '' },
    { id: 4, fullName: 'Phạm Đức D', email: 'phamducd@email.com', phone: '0934567890', address: '321 CMT8, Q.10, TP.HCM', role: 'USER', orders: 2, avatar: '' },
    { id: 5, fullName: 'Võ Ngọc E', email: 'vongoce@email.com', phone: '0945678901', address: '654 Võ Văn Tần, Q.3, TP.HCM', role: 'USER', orders: 6, avatar: '' },
    { id: 6, fullName: 'Trần Minh F', email: 'tranminhf@email.com', phone: '0956789012', address: '987 Điện Biên Phủ, Bình Thạnh', role: 'USER', orders: 1, avatar: '' },
    { id: 7, fullName: 'Hoàng Anh G', email: 'hoanganhg@email.com', phone: '0967890123', address: '246 Phan Xích Long, Phú Nhuận', role: 'ADMIN', orders: 0, avatar: '' },
    { id: 8, fullName: 'Admin', email: 'admin@laptopshop.vn', phone: '0900000001', address: 'HCM, Vietnam', role: 'ADMIN', orders: 0, avatar: '' },
];

const rolesData = [
    { id: 1, name: 'ADMIN', description: 'Quản trị viên hệ thống - có toàn quyền truy cập', userCount: 2 },
    { id: 2, name: 'USER', description: 'Người dùng thông thường - có quyền mua hàng, đặt đơn', userCount: 5845 },
];

// ==========================================
// ===== NAVIGATION =======================
// ==========================================

function initNavigation() {
    const navItems = document.querySelectorAll('.nav-item[data-page]');
    const pageSections = document.querySelectorAll('.page-section');

    navItems.forEach(item => {
        item.addEventListener('click', (e) => {
            e.preventDefault();
            const page = item.getAttribute('data-page');

            // Update active nav
            navItems.forEach(n => n.classList.remove('active'));
            item.classList.add('active');

            // Show page section
            pageSections.forEach(s => s.classList.remove('active'));
            const targetPage = document.getElementById(`page-${page}`);
            if (targetPage) {
                targetPage.classList.add('active');
            }

            // Close sidebar on mobile
            if (window.innerWidth <= 768) {
                document.getElementById('sidebar').classList.remove('mobile-open');
                document.getElementById('mobileOverlay').classList.remove('active');
            }
        });
    });

    // Also handle "Xem tất cả" buttons that navigate
    document.querySelectorAll('[data-page]').forEach(btn => {
        if (!btn.classList.contains('nav-item')) {
            btn.addEventListener('click', () => {
                const page = btn.getAttribute('data-page');
                const navTarget = document.querySelector(`.nav-item[data-page="${page}"]`);
                if (navTarget) navTarget.click();
            });
        }
    });

    // Set active sidebar item based on current URL
    const path = window.location.pathname;
    const allNavs = document.querySelectorAll('.sidebar-nav .nav-item');
    if (allNavs.length > 0) {
        allNavs.forEach(item => item.classList.remove('active'));
        if (path.startsWith('/admin/product')) {
            const el = document.getElementById('nav-products');
            if (el) el.classList.add('active');
        } else if (path.startsWith('/admin/order')) {
            const el = document.getElementById('nav-orders');
            if (el) el.classList.add('active');
        } else if (path.startsWith('/admin/user')) {
            const el = document.getElementById('nav-users');
            if (el) el.classList.add('active');
        } else if (path.includes('/admin')) {
            const el = document.getElementById('nav-dashboard');
            if (el) el.classList.add('active');
        }
    }
}

// ==========================================
// ===== SIDEBAR ==========================
// ==========================================

function initSidebar() {
    const sidebar = document.getElementById('sidebar');
    const toggle = document.getElementById('sidebarToggle');
    const overlay = document.getElementById('mobileOverlay');

    if (!toggle || !sidebar || !overlay) return;

    toggle.addEventListener('click', () => {
        if (window.innerWidth <= 768) {
            sidebar.classList.toggle('mobile-open');
            overlay.classList.toggle('active');
        } else {
            sidebar.classList.toggle('collapsed');
        }
    });

    overlay.addEventListener('click', () => {
        sidebar.classList.remove('mobile-open');
        overlay.classList.remove('active');
    });
}

// ==========================================
// ===== HEADER ===========================
// ==========================================

function initHeader() {
    // Fullscreen
    const btnFullscreen = document.getElementById('btnFullscreen');
    if (btnFullscreen) {
        btnFullscreen.addEventListener('click', () => {
            if (!document.fullscreenElement) {
                document.documentElement.requestFullscreen();
                btnFullscreen.querySelector('i').className = 'fas fa-compress';
            } else {
                document.exitFullscreen();
                btnFullscreen.querySelector('i').className = 'fas fa-expand';
            }
        });
    }

    // Notifications demo
    const btnNotifications = document.getElementById('btnNotifications');
    if (btnNotifications) {
        btnNotifications.addEventListener('click', () => {
            showToast('info', 'Thông báo', 'Bạn có 3 đơn hàng mới chờ xử lý.');
        });
    }

    // Messages demo
    const btnMessages = document.getElementById('btnMessages');
    if (btnMessages) {
        btnMessages.addEventListener('click', () => {
            showToast('info', 'Tin nhắn', 'Không có tin nhắn mới.');
        });
    }
}

// ==========================================
// ===== REVENUE CHART ====================
// ==========================================

function renderRevenueChart() {
    const chartContainer = document.getElementById('revenueChart');
    if (!chartContainer) return;

    const monthlyData = [
        { month: 'T1', revenue: 65 },
        { month: 'T2', revenue: 78 },
        { month: 'T3', revenue: 90 },
        { month: 'T4', revenue: 81 },
        { month: 'T5', revenue: 56 },
        { month: 'T6', revenue: 72 },
        { month: 'T7', revenue: 95 },
        { month: 'T8', revenue: 88 },
        { month: 'T9', revenue: 76 },
        { month: 'T10', revenue: 68 },
        { month: 'T11', revenue: 85 },
        { month: 'T12', revenue: 92 },
    ];

    const maxRevenue = Math.max(...monthlyData.map(d => d.revenue));

    chartContainer.innerHTML = monthlyData.map(d => {
        const heightPercent = (d.revenue / maxRevenue) * 100;
        return `
            <div class="chart-bar-group">
                <div class="chart-bar primary" style="height: ${heightPercent}%;" title="${d.month}: ${d.revenue}M VND"></div>
                <span class="chart-bar-label">${d.month}</span>
            </div>
        `;
    }).join('');

    // Animate bars in
    setTimeout(() => {
        const bars = chartContainer.querySelectorAll('.chart-bar');
        bars.forEach((bar, i) => {
            const targetHeight = bar.style.height;
            bar.style.height = '0%';
            bar.style.transition = `height 0.6s cubic-bezier(0.4, 0, 0.2, 1) ${i * 0.05}s`;
            requestAnimationFrame(() => {
                bar.style.height = targetHeight;
            });
        });
    }, 300);
}

// ==========================================
// ===== PRODUCTS TABLE ===================
// ==========================================

function renderProductsTable() {
    const tbody = document.getElementById('productsTableBody');
    if (!tbody) return;

    tbody.innerHTML = productsData.map(product => {
        const initials = product.factory.substring(0, 2).toUpperCase();
        const stockClass = product.quantity <= 5 ? 'danger' : product.quantity <= 20 ? 'warning' : 'success';
        const stockLabel = product.quantity <= 5 ? 'Sắp hết' : product.quantity <= 20 ? 'Còn ít' : 'Còn hàng';

        return `
            <tr>
                <td><input type="checkbox" class="custom-checkbox product-check" data-id="${product.id}"></td>
                <td>
                    <div class="table-product">
                        <div class="table-product-img">💻</div>
                        <div class="table-product-info">
                            <h4>${product.name}</h4>
                            <span>${product.shortDesc}</span>
                        </div>
                    </div>
                </td>
                <td><span class="status-badge purple">${product.factory}</span></td>
                <td><strong>${formatCurrency(product.price)}</strong></td>
                <td><span class="status-badge ${stockClass}">${product.quantity} (${stockLabel})</span></td>
                <td>${product.sold}</td>
                <td><span class="status-badge info">${product.target}</span></td>
                <td>
                    <div class="table-actions">
                        <button class="table-action-btn" title="Xem" onclick="viewProduct(${product.id})"><i class="fas fa-eye"></i></button>
                        <button class="table-action-btn" title="Sửa" onclick="editProduct(${product.id})"><i class="fas fa-pen"></i></button>
                        <button class="table-action-btn delete" title="Xoá" onclick="deleteItem('product', ${product.id}, '${product.name}')"><i class="fas fa-trash"></i></button>
                    </div>
                </td>
            </tr>
        `;
    }).join('');
}

// ==========================================
// ===== ORDERS TABLE =====================
// ==========================================

function renderOrdersTable() {
    const tbody = document.getElementById('ordersTableBody');
    if (!tbody) return;

    const gradients = [
        'var(--gradient-primary)', 'var(--gradient-green)', 'var(--gradient-purple)',
        'var(--gradient-orange)', 'linear-gradient(135deg, #06b6d4, #22c55e)'
    ];

    tbody.innerHTML = ordersData.map((order, idx) => {
        const initials = order.customer.split(' ').map(w => w[0]).join('').substring(0, 2).toUpperCase();
        const statusMap = {
            'Hoàn thành': 'success',
            'Đang giao': 'warning',
            'Xử lý': 'info',
            'Đã hủy': 'danger'
        };
        const statusClass = statusMap[order.status] || 'info';
        const gradient = gradients[idx % gradients.length];

        return `
            <tr>
                <td><input type="checkbox" class="custom-checkbox order-check" data-id="${order.id}"></td>
                <td><strong>#${order.id}</strong></td>
                <td>
                    <div class="table-user">
                        <div class="table-user-avatar" style="background: ${gradient};">${initials}</div>
                        <div>
                            <div style="font-weight: 600;">${order.customer}</div>
                            <div style="font-size: 0.72rem; color: var(--text-muted);">${order.email}</div>
                        </div>
                    </div>
                </td>
                <td><strong>${formatCurrency(order.totalPrice)}</strong></td>
                <td><span class="status-badge ${statusClass}">${order.status}</span></td>
                <td>${order.date}</td>
                <td>
                    <div class="table-actions">
                        <button class="table-action-btn" title="Xem chi tiết"><i class="fas fa-eye"></i></button>
                        <button class="table-action-btn" title="In hoá đơn"><i class="fas fa-print"></i></button>
                        <button class="table-action-btn delete" title="Xoá" onclick="deleteItem('order', '${order.id}', 'Đơn hàng #${order.id}')"><i class="fas fa-trash"></i></button>
                    </div>
                </td>
            </tr>
        `;
    }).join('');
}

// ==========================================
// ===== USERS TABLE ======================
// ==========================================

function renderUsersTable() {
    const tbody = document.getElementById('usersTableBody');
    if (!tbody) return;

    const gradients = [
        'var(--gradient-primary)', 'var(--gradient-green)', 'var(--gradient-purple)',
        'var(--gradient-orange)', 'linear-gradient(135deg, #06b6d4, #22c55e)'
    ];

    tbody.innerHTML = usersData.map((user, idx) => {
        const initials = user.fullName.split(' ').map(w => w[0]).join('').substring(0, 2).toUpperCase();
        const roleClass = user.role === 'ADMIN' ? 'danger' : 'info';
        const gradient = gradients[idx % gradients.length];

        return `
            <tr>
                <td><input type="checkbox" class="custom-checkbox user-check" data-id="${user.id}"></td>
                <td>
                    <div class="table-user">
                        <div class="table-user-avatar" style="background: ${gradient};">${initials}</div>
                        <div>
                            <div style="font-weight: 600;">${user.fullName}</div>
                            <div style="font-size: 0.72rem; color: var(--text-muted);">${user.address}</div>
                        </div>
                    </div>
                </td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td><span class="status-badge ${roleClass}">${user.role}</span></td>
                <td>${user.orders}</td>
                <td>
                    <div class="table-actions">
                        <button class="table-action-btn" title="Xem" onclick="viewUser(${user.id})"><i class="fas fa-eye"></i></button>
                        <button class="table-action-btn" title="Sửa" onclick="editUser(${user.id})"><i class="fas fa-pen"></i></button>
                        <button class="table-action-btn delete" title="Xoá" onclick="deleteItem('user', ${user.id}, '${user.fullName}')"><i class="fas fa-trash"></i></button>
                    </div>
                </td>
            </tr>
        `;
    }).join('');
}

// ==========================================
// ===== ROLES TABLE ======================
// ==========================================

function renderRolesTable() {
    const tbody = document.getElementById('rolesTableBody');
    if (!tbody) return;

    tbody.innerHTML = rolesData.map(role => {
        const roleClass = role.name === 'ADMIN' ? 'danger' : 'info';

        return `
            <tr>
                <td><strong>${role.id}</strong></td>
                <td><span class="status-badge ${roleClass}">${role.name}</span></td>
                <td>${role.description}</td>
                <td><strong>${role.userCount.toLocaleString('vi-VN')}</strong> người dùng</td>
                <td>
                    <div class="table-actions">
                        <button class="table-action-btn" title="Sửa"><i class="fas fa-pen"></i></button>
                        <button class="table-action-btn delete" title="Xoá" onclick="deleteItem('role', ${role.id}, 'Vai trò ${role.name}')"><i class="fas fa-trash"></i></button>
                    </div>
                </td>
            </tr>
        `;
    }).join('');
}

// ==========================================
// ===== MODALS ===========================
// ==========================================

function initModals() {
    // Add Product
    const btnAddProduct = document.getElementById('btnAddProduct');
    if (btnAddProduct) {
        btnAddProduct.addEventListener('click', () => {
            document.getElementById('productModalTitle').textContent = 'Thêm sản phẩm mới';
            document.getElementById('productForm').reset();
            openModal('productModal');
        });
    }

    // Save Product
    const btnSaveProduct = document.getElementById('btnSaveProduct');
    if (btnSaveProduct) {
        btnSaveProduct.addEventListener('click', () => {
            const name = document.getElementById('productName').value;
            if (!name) {
                showToast('error', 'Lỗi', 'Vui lòng nhập tên sản phẩm.');
                return;
            }
            closeModal('productModal');
            showToast('success', 'Thành công!', `Sản phẩm "${name}" đã được lưu.`);
        });
    }

    // Add User
    const btnAddUser = document.getElementById('btnAddUser');
    if (btnAddUser) {
        btnAddUser.addEventListener('click', () => {
            document.getElementById('userModalTitle').textContent = 'Thêm người dùng mới';
            document.getElementById('userForm').reset();
            openModal('userModal');
        });
    }

    // Save User
    const btnSaveUser = document.getElementById('btnSaveUser');
    if (btnSaveUser) {
        btnSaveUser.addEventListener('click', () => {
            const name = document.getElementById('userFullName').value;
            if (!name) {
                showToast('error', 'Lỗi', 'Vui lòng nhập họ tên.');
                return;
            }
            closeModal('userModal');
            showToast('success', 'Thành công!', `Người dùng "${name}" đã được lưu.`);
        });
    }

    // Confirm Delete
    const btnConfirmDelete = document.getElementById('btnConfirmDelete');
    if (btnConfirmDelete) {
        btnConfirmDelete.addEventListener('click', () => {
            closeModal('deleteModal');
            showToast('success', 'Đã xoá!', 'Mục đã được xoá thành công.');
        });
    }

    // Close modal on overlay click
    document.querySelectorAll('.modal-overlay').forEach(overlay => {
        overlay.addEventListener('click', (e) => {
            if (e.target === overlay) {
                overlay.classList.remove('active');
            }
        });
    });

    // Close modal on Escape key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            document.querySelectorAll('.modal-overlay.active').forEach(m => {
                m.classList.remove('active');
            });
        }
    });

    // Dashboard "Thêm sản phẩm" quick button
    document.querySelectorAll('.page-actions .btn-primary').forEach(btn => {
        if (btn.textContent.includes('Thêm sản phẩm') && !btn.id) {
            btn.addEventListener('click', () => {
                // Navigate to products page then open modal
                const navProducts = document.querySelector('.nav-item[data-page="products"]');
                if (navProducts) navProducts.click();
                setTimeout(() => {
                    document.getElementById('productModalTitle').textContent = 'Thêm sản phẩm mới';
                    document.getElementById('productForm').reset();
                    openModal('productModal');
                }, 350);
            });
        }
    });
}

function openModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) modal.classList.add('active');
}

function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) modal.classList.remove('active');
}

// ==========================================
// ===== CRUD ACTIONS =====================
// ==========================================

function viewProduct(id) {
    const product = productsData.find(p => p.id === id);
    if (product) {
        showToast('info', product.name, `Giá: ${formatCurrency(product.price)} | Tồn kho: ${product.quantity} | Đã bán: ${product.sold}`);
    }
}

function editProduct(id) {
    const product = productsData.find(p => p.id === id);
    if (!product) return;

    document.getElementById('productModalTitle').textContent = 'Chỉnh sửa sản phẩm';
    document.getElementById('productName').value = product.name;
    document.getElementById('productPrice').value = product.price;
    document.getElementById('productQuantity').value = product.quantity;
    document.getElementById('productFactory').value = product.factory;
    document.getElementById('productTarget').value = product.target;
    document.getElementById('productShortDesc').value = product.shortDesc;
    document.getElementById('productDetailDesc').value = '';
    document.getElementById('productImage').value = product.image;

    openModal('productModal');
}

function viewUser(id) {
    const user = usersData.find(u => u.id === id);
    if (user) {
        showToast('info', user.fullName, `Email: ${user.email} | SĐT: ${user.phone} | Vai trò: ${user.role}`);
    }
}

function editUser(id) {
    const user = usersData.find(u => u.id === id);
    if (!user) return;

    document.getElementById('userModalTitle').textContent = 'Chỉnh sửa người dùng';
    document.getElementById('userFullName').value = user.fullName;
    document.getElementById('userEmail').value = user.email;
    document.getElementById('userPhone').value = user.phone;
    document.getElementById('userRole').value = user.role;
    document.getElementById('userAddress').value = user.address;
    document.getElementById('userPassword').value = '';

    openModal('userModal');
}

function deleteItem(type, id, name) {
    document.getElementById('deleteItemName').textContent = `Bạn sắp xoá: "${name}". Hành động này không thể hoàn tác.`;
    openModal('deleteModal');
}

// ==========================================
// ===== FILTERS ==========================
// ==========================================

function initFilters() {
    // Product search
    const productSearch = document.getElementById('productSearch');
    if (productSearch) {
        productSearch.addEventListener('input', debounce(() => {
            const query = productSearch.value.toLowerCase();
            filterTable('productsTableBody', query, (row) => {
                return row.textContent.toLowerCase().includes(query);
            });
        }, 300));
    }

    // Order search
    const orderSearch = document.getElementById('orderSearch');
    if (orderSearch) {
        orderSearch.addEventListener('input', debounce(() => {
            const query = orderSearch.value.toLowerCase();
            filterTable('ordersTableBody', query, (row) => {
                return row.textContent.toLowerCase().includes(query);
            });
        }, 300));
    }

    // User search
    const userSearch = document.getElementById('userSearch');
    if (userSearch) {
        userSearch.addEventListener('input', debounce(() => {
            const query = userSearch.value.toLowerCase();
            filterTable('usersTableBody', query, (row) => {
                return row.textContent.toLowerCase().includes(query);
            });
        }, 300));
    }

    // Select-all checkboxes
    ['selectAllProducts', 'selectAllOrders', 'selectAllUsers'].forEach(id => {
        const selectAll = document.getElementById(id);
        if (selectAll) {
            selectAll.addEventListener('change', () => {
                const tbody = selectAll.closest('table').querySelector('tbody');
                tbody.querySelectorAll('.custom-checkbox').forEach(cb => {
                    cb.checked = selectAll.checked;
                });
            });
        }
    });

    // Global search
    const globalSearch = document.getElementById('globalSearch');
    if (globalSearch) {
        globalSearch.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') {
                const query = globalSearch.value.trim();
                if (query) {
                    showToast('info', 'Tìm kiếm', `Đang tìm "${query}"...`);
                }
            }
        });
    }
}

function filterTable(tbodyId, query, matchFn) {
    const tbody = document.getElementById(tbodyId);
    if (!tbody) return;

    const rows = tbody.querySelectorAll('tr');
    rows.forEach(row => {
        if (!query || matchFn(row)) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
}

// ==========================================
// ===== TOAST NOTIFICATIONS ==============
// ==========================================

function showToast(type, title, message) {
    const container = document.getElementById('toastContainer');
    if (!container) return;

    const iconMap = {
        success: 'fas fa-check-circle',
        error: 'fas fa-times-circle',
        warning: 'fas fa-exclamation-circle',
        info: 'fas fa-info-circle'
    };

    const toast = document.createElement('div');
    toast.className = `toast ${type}`;
    toast.innerHTML = `
        <i class="${iconMap[type]}"></i>
        <div class="toast-content">
            <h4>${title}</h4>
            <p>${message}</p>
        </div>
        <button class="toast-close" onclick="this.closest('.toast').remove()">
            <i class="fas fa-times"></i>
        </button>
    `;

    container.appendChild(toast);

    // Auto remove after 4s
    setTimeout(() => {
        toast.style.opacity = '0';
        toast.style.transform = 'translateX(100%)';
        toast.style.transition = 'all 0.3s ease';
        setTimeout(() => toast.remove(), 300);
    }, 4000);
}

// ==========================================
// ===== UTILITY FUNCTIONS ================
// ==========================================

function formatCurrency(amount) {
    return '₫ ' + amount.toLocaleString('vi-VN');
}

function debounce(fn, delay) {
    let timer;
    return (...args) => {
        clearTimeout(timer);
        timer = setTimeout(() => fn(...args), delay);
    };
}

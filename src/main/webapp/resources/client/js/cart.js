$(document).ready(function() {
    // Cập nhật lại tổng số lượng và tổng tiền toàn giỏ hàng
    function updateCartTotal() {
        let totalItems = 0;
        let totalPrice = 0;
        
        $('.cart-item').each(function() {
            let qty = parseInt($(this).find('.input-qty').val());
            let price = parseFloat($(this).find('.item-subtotal').attr('data-price'));
            totalItems += qty;
            totalPrice += qty * price;
        });

        $('#cart-total-items').text(totalItems);
        
        // Format giá tiền hiển thị (+ ₫)
        let formattedTotal = totalPrice.toLocaleString('en-US').replace(/,/g, ',') + '₫';
        $('#cart-subtotal-price').text(formattedTotal);
        $('#cart-total-price').text(formattedTotal);
        
        // Cập nhật lại số lượng sản phẩm trên badge H1 (nếu có)
        if ($('.cart-count-badge').length) {
            $('.cart-count-badge').text(totalItems + ' sản phẩm');
        }
    }

    // Xử lý sự kiện click nút Tăng
    $('.btn-plus').click(function() {
        let input = $(this).siblings('.input-qty');
        let currentVal = parseInt(input.val());
        let newVal = currentVal + 1;
        input.val(newVal);
        
        // Sync with hidden input for form submission
        let detailId = input.attr('data-id');
        if (detailId) {
            $('.hidden-qty[data-id="' + detailId + '"]').val(newVal);
        }
        
        let price = parseFloat($(this).attr('data-price'));
        let subtotal = price * newVal;
        let formattedSubtotal = subtotal.toLocaleString('en-US').replace(/,/g, ',') + '₫';
        
        $(this).closest('.cart-item').find('.item-subtotal').text(formattedSubtotal);
        updateCartTotal();
    });

    // Xử lý sự kiện click nút Giảm
    $('.btn-minus').click(function() {
        let input = $(this).siblings('.input-qty');
        let currentVal = parseInt(input.val());
        if (currentVal > 1) {
            let newVal = currentVal - 1;
            input.val(newVal);
            
            // Sync with hidden input for form submission
            let detailId = input.attr('data-id');
            if (detailId) {
                $('.hidden-qty[data-id="' + detailId + '"]').val(newVal);
            }
            
            let price = parseFloat($(this).attr('data-price'));
            let subtotal = price * newVal;
            let formattedSubtotal = subtotal.toLocaleString('en-US').replace(/,/g, ',') + '₫';
            
            $(this).closest('.cart-item').find('.item-subtotal').text(formattedSubtotal);
            updateCartTotal();
        }
    });

    // Xử lý sự kiện click nút Xoá sản phẩm
    $('.btn-remove-item').click(function() {
        let item = $(this).closest('.cart-item');
        // Fade out animation
        item.fadeOut(300, function() {
            // Xóa element khỏi DOM
            item.remove();
            // Cập nhật lại tổng tiền
            updateCartTotal();
            
            // Nếu không còn sản phẩm nào trong giỏ hàng thì reload trang 
            // để hiển thị giao diện giỏ hàng trống từ server
            if ($('.cart-item').length === 0) {
                location.reload();
            }
        });
    });
});

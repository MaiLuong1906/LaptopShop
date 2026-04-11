// home.js

document.addEventListener('DOMContentLoaded', () => {
    // Scroll Effect for Header
    const header = document.querySelector('.glass-header');
    
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            header.style.background = 'rgba(15, 23, 42, 0.85)';
            header.style.boxShadow = '0 4px 30px rgba(0, 0, 0, 0.5)';
        } else {
            header.style.background = 'var(--glass-bg)';
            header.style.boxShadow = 'none';
        }
    });

    // Add staggered entrance animations to product cards
    const cards = document.querySelectorAll('.product-card');
    
    const observerOptions = {
        threshold: 0.1,
        rootMargin: "0px 0px -50px 0px"
    };

    const cardObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach((entry, index) => {
            if (entry.isIntersecting) {
                setTimeout(() => {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }, index * 100);
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    cards.forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(30px)';
        card.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
        cardObserver.observe(card);
    });

    // Interactive Like Buttons
    const likeBtns = document.querySelectorAll('.fa-heart');
    likeBtns.forEach(btn => {
        btn.parentElement.addEventListener('click', function(e) {
            e.preventDefault();
            this.style.transform = 'scale(0.8)';
            setTimeout(() => {
                this.style.transform = 'scale(1)';
                if(btn.classList.contains('fa-regular')) {
                    btn.classList.remove('fa-regular');
                    btn.classList.add('fa-solid');
                    btn.style.color = '#f43f5e';
                } else {
                    btn.classList.remove('fa-solid');
                    btn.classList.add('fa-regular');
                    btn.style.color = '';
                }
            }, 150);
        });
    });
});

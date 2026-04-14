// Update the sort hidden field when select changes, then submit form
function updateSortAndSubmit(sortValue) {
    const sortInput = document.querySelector("input[name='sort']");
    if (sortInput) {
        sortInput.value = sortValue;
        document.getElementById("filterForm").submit();
    }
}

// Handle Pagination link click to append filter params
function changePage(page) {
    let url = new URL(window.location.href);
    url.searchParams.set('page', page);
    window.location.href = url.href;
}

document.addEventListener('DOMContentLoaded', () => {
    // Checkbox auto-submit (optional user experience enhancement)
    const filters = document.querySelectorAll('.custom-checkbox');
    filters.forEach(filter => {
        filter.addEventListener('change', () => {
            // To enable auto-filter when click checkbox, uncomment below:
            // document.getElementById('filterForm').submit();
        });
    });
});

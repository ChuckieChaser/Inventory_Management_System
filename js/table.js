const tableBody = document.querySelector('.table__content table tbody');
const tableHeaders = document.querySelectorAll('.table__content table thead th');
const tableRowsArray = Array.from(document.querySelectorAll('.table__content table tbody tr:not(.empty__row)'));
const emptyRow = document.querySelector('.empty__row');
const searchTextfield = document.querySelector('.search__textfield input');
const resetButton = document.querySelector('.table__header-search button');

const sortStates = {
    0: { current: 0, cycles: ['original'] },
    1: { current: 0, cycles: ['original', 'ascending', 'descending'] },
    2: { current: 0, cycles: ['original', 'ascending', 'descending'] },
    3: { current: 0, cycles: ['original', 'available', 'low stock', 'out of stock'] },
    4: { current: 0, cycles: ['original', 'latest', 'oldest'] },
};

const categories = new Set();
tableRowsArray.forEach((row) => {
    const idText = row.cells[0].textContent.trim();
    const parts = idText.split('-');

    if (parts.length >= 2) {
        const category = parts[1];
        categories.add(category);
    }
});

sortStates[0].cycles = ['original', ...Array.from(categories)];

const updateTableDisplay = () => {
    let workingRows = [...tableRowsArray];
    const searchQuery = searchTextfield ? searchTextfield.value.toLowerCase().trim() : '';

    if (searchQuery) workingRows = workingRows.filter((row) => row.cells[1].textContent.toLowerCase().includes(searchQuery));

    Object.keys(sortStates).forEach((index) => {
        const stateIndex = sortStates[index].current;
        const currentCycleValue = sortStates[index].cycles[stateIndex];

        if (currentCycleValue === 'original') return;

        const columnIndex = parseInt(index);

        if (columnIndex === 0) {
            // ITEM ID FILTER CYCLE
            workingRows = workingRows.filter((row) => {
                const parts = row.cells[columnIndex].textContent.trim().split('-');
                return parts[1] === currentCycleValue;
            });
        } else if (columnIndex === 1) {
            // NAME FILTER CYCLE
            workingRows.sort((a, b) => {
                const valA = a.cells[columnIndex].textContent.trim().toLowerCase();
                const valB = b.cells[columnIndex].textContent.trim().toLowerCase();
                return currentCycleValue === 'ascending' ? valA.localeCompare(valB) : valB.localeCompare(valA);
            });
        } else if (columnIndex === 2) {
            // QUANTITY FILTER CYCLE
            workingRows.sort((a, b) => {
                const valA = parseFloat(a.cells[columnIndex].textContent) || 0;
                const valB = parseFloat(b.cells[columnIndex].textContent) || 0;
                return currentCycleValue === 'ascending' ? valA - valB : valB - valA;
            });
        } else if (columnIndex === 3) {
            // STATUS FILTER CYCLE
            workingRows = workingRows.filter((row) => row.cells[columnIndex].textContent.toLowerCase().trim() === currentCycleValue);
        } else if (columnIndex === 4) {
            // LAST UPDATE FILTER CYCLE
            workingRows.sort((a, b) => {
                const valA = new Date(a.cells[columnIndex].textContent.trim());
                const valB = new Date(b.cells[columnIndex].textContent.trim());
                return currentCycleValue === 'latest' ? valB - valA : valA - valB;
            });
        }
    });

    tableRowsArray.forEach((row) => (row.style.display = 'none'));

    if (workingRows.length === 0) {
        if (emptyRow) emptyRow.style.display = '';
    } else {
        if (emptyRow) emptyRow.style.display = 'none';

        workingRows.forEach((row) => {
            row.style.display = '';
            tableBody.appendChild(row);
        });
    }
};

tableHeaders.forEach((header, index) => {
    header.addEventListener('click', () => {
        Object.keys(sortStates).forEach((idx) => {
            if (parseInt(idx) !== index) sortStates[idx].current = 0;
        });

        sortStates[index].current = (sortStates[index].current + 1) % sortStates[index].cycles.length;
        updateTableDisplay();
    });
});

if (searchTextfield) {
    searchTextfield.addEventListener('input', updateTableDisplay);
}

if (resetButton && searchTextfield) {
    resetButton.addEventListener('click', () => {
        searchTextfield.value = '';
        Object.keys(sortStates).forEach((idx) => (sortStates[idx].current = 0));
        updateTableDisplay();
    });
}

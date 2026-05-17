const searchTextfield = document.getElementById('searchTextfield');
const searchButton = document.getElementById('searchButton');

const tableContent = document.getElementById('tableContent');

const namespaceResolver = (prefix) => {
    if (prefix === 'inventory') return 'http://www.plpasig.com/inventory';
    return null;
};

searchButton.addEventListener('click', async () => {
    const searchInput = searchTextfield.value.trim().toLowerCase();
    if (searchInput === '') {
        window.location.reload();
        return;
    }

    const response = await fetch('../inventory.xml');
    const xmlText = await response.text();
    const parser = new DOMParser();
    const xmlDocument = parser.parseFromString(xmlText, 'application/xml');

    const xpathQuery = `
        //inventory:item[contains(
            translate(inventory:name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),
            '${searchInput}'
        )]
    `;

    tableContent.innerHTML = '';

    try {
        const results = document.evaluate(xpathQuery, xmlDocument, namespaceResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);

        if (results.snapshotLength === 0) {
            tableContent.innerHTML = `
                <tr>
                    <td colspan="6" style="text-align: center;">No items match your search.</td>
                </tr>
            `;

            return;
        }

        for (let i = 0; i < results.snapshotLength; i++) {
            const item = results.snapshotItem(i);

            const id = item.getAttribute('id');
            const name = item.getElementsByTagNameNS('http://www.plpasig.com/inventory', 'name')[0].textContent;
            const quantity = item.getElementsByTagNameNS('http://www.plpasig.com/inventory', 'quantity')[0].textContent;
            const status = item.getElementsByTagNameNS('http://www.plpasig.com/inventory', 'status')[0].textContent;
            const lastUpdate = item.getElementsByTagNameNS('http://www.plpasig.com/inventory', 'last_update')[0].textContent;

            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${i + 1}</td>
                <td>${id}</td>
                <td>${name}</td>
                <td>${quantity}</td>
                <td data-status="${status}">
                    <div class="status__badge">
                        <div class="status__badge-icon"></div>
                        <span>${status}</span>
                    </div>
                </td>
                <td>${lastUpdate}</td>
            `;

            tableContent.appendChild(row);
            console.log(results.snapshotItem(i));
        }
    } catch (error) {
        console.log('XPath Evaluation Failed: ', error);
    }
});

searchTextfield.addEventListener('keydown', (event) => {
    if (event.key === 'Enter') {
        event.preventDefault();
        searchButton.click();
    }
});

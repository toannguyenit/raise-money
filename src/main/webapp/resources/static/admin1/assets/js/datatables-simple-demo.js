window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple,  {
            searchable: true,
            columns: [
                { index: 0, searchable: false }, 
                { index: 1, searchable: true }, 
                { index: 2, searchable: true },  
            ],
        });
    }
});

// ... map creation code ...

var dataTable = document.getElementById('regionalDataTable');
var dropdown = document.getElementById('yearDropdown');

// Example data structure. Modify according to your data.
var data2 = {
    "2021": ["Value 1", "Value 2", "Value 3", "Value 4", "Value 5", "Value 6", "Value 7", "Value 8", "Value 9", "Value 10", "Value 11", "Value 12", "Value 13", "Value 14", "Value 15", "Value 16", "Value 17", "Value 18"],
    "2022": ["Value 19", "Value 20", "Value 21", "Value 22", "Value 23", "Value 24", "Value 25", "Value 26", "Value 27", "Value 28", "Value 29", "Value 30", "Value 31", "Value 32", "Value 33", "Value 34", "Value 35", "Value 36"],
    "2023": ["Value 37", "Value 38", "Value 39", "Value 40", "Value 41", "Value 42", "Value 43", "Value 44", "Value 45", "Value 46", "Value 47", "Value 48", "Value 49", "Value 50", "Value 51", "Value 52", "Value 53", "Value 54"]
};

// Function to update the data table
function updateTable(year) {
    var values = data2[year];
    for (var i = 0; i < dataTable.rows.length; i++) {
        var row = dataTable.rows[i];
        for (var j = 0; j < row.cells.length; j++) {
            var cellIndex = i * row.cells.length + j;
            row.cells[j].textContent = values[cellIndex];
        }
    }
}



// Initial table update
updateTable(dropdown.value);

// Update table when the dropdown selection changes
dropdown.addEventListener('change', function() {
    updateTable(this.value);
});

$.ajax({
    type: 'GET',
    url: 'https://localhost:3000/api/v1/laboratories/out_of_date',
    data: { get_param: 'value' },
    dataType: 'json',
    success: function (data) {
        drawTable(data);
    }
});



function drawTable(data) {
    for (var i = 0; i < data.data.length; i++) {
        drawRow(data.data[i]);
    }
}

function drawRow(rowData) {
    var row = $("<tr />")
    $("#personDataTable").append(row); //this will append tr element to table... keep its reference for a while since we will add cels into it
    row.append($("<td>" + rowData.attributes["contact-name"]+ "</td>"));
    row.append($("<td>" + rowData.attributes["laboratory-name"]+ "</td>"));
    row.append($("<td>" + rowData.attributes["address1"] + "</td>"));
		row.append($("<td>" + rowData.attributes["address2"] + "</td>"));
		row.append($("<td>" + rowData.attributes["address3"] + "</td>"));
		row.append($("<td>" + rowData.attributes["city"] + "</td>"));
		row.append($("<td>" + rowData.attributes["postcode"] + "</td>"));
}

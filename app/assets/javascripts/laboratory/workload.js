$.ajax({
	type: 'GET',
	url: getUrl (),
	dataType: 'json',
	success: function (data) {
		myFirstChart (data);
	}
});



function drawTable(data) {
	workloadTable.textContent = '';
	$("#workloadTable").append("<table>");
	$("#workloadTable").append("<tr><th>No Months Out of Date</th><th>Count of Labs</th></tr>");
	for (var i = 0; i < data.length; i++) {
		drawRow(data[i]);
	}
	$("#workloadTable").append("</table>");


}

function drawRow(rowData) {
	var row = $("<tr />")
	$("#workloadTable").append(row); //this will append tr element to table... keep its reference for a while since we will add cels into it
	row.append($("<td>" + rowData["months"]+ "</td>"));
	row.append($("<td>" + rowData["count"]+ "</td>"));
}

function getUrl () {
	pageUrl = '/api/v1/laboratories/workload'
	return pageUrl
}

function drawWorkloadChart (data) {
	$('#workloadChart').sparkline(generateSparklineData (data), {
		type: 'bar',
		width: '100%',
		height:'100px',
		fillColor: 'rgba(209, 218, 222, 0.30)',
		lineColor: '#fff',
		spotRadius: 4,
		valueSpots:[4,3,3,1,4,3,2,2,3],
		minSpotColor: '#d1dade',
		maxSpotColor: '#d1dade',
		highlightSpotColor: '#d1dade',
		highlightLineColor: '#bec6ca',
		normalRangeMin: 0
	});
}

	function generateSparklineData (data) {
		xData = [];
		for (var i = 0; i < data.length; i++) {
			xData.push(data[i]['count']);
		}
		return xData;
	}

	function myFirstChart (data) {
		Morris.Bar({
		  element: 'myfirstchart',
		  data: generateData (data) ,
		  xkey: 'y',
		  ykeys: ['a'],
			grid: true,
			xLabels: "month",
		  labels: ['Number of Labs out of Date']
		});
	}

	function generateData (data) {
		xData = [];
		for (var i = 0; i < data.length; i++) {
			h = {};
      h['y'] = data[i]['months']
			h['a'] = data[i]['count']
			xData.push(h);
		}
		return xData;
	}

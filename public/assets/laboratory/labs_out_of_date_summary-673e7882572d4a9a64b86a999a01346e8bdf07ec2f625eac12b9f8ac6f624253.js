function drawTable(t){for(var a=0;a<t.data.length;a++)drawRow(t.data[a])}function drawRow(t){var a=$("<tr />");$("#personDataTable").append(a),a.append($("<td>"+t.attributes["contact-name"]+"</td>")),a.append($("<td>"+t.attributes["laboratory-name"]+"</td>")),a.append($("<td>"+t.attributes.address1+"</td>")),a.append($("<td>"+t.attributes.address2+"</td>")),a.append($("<td>"+t.attributes.address3+"</td>")),a.append($("<td>"+t.attributes.city+"</td>")),a.append($("<td>"+t.attributes.postcode+"</td>"))}$.ajax({type:"GET",url:"https://localhost:3000/api/v1/laboratories/out_of_date",data:{get_param:"value"},dataType:"json",success:function(t){drawTable(t)}});
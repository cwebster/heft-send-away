function drawTable(t){for(var a=0;a<t.data.length;a++)drawRow(t.data[a])}function drawRow(t){var a=$("<tr />");$("#laboratoryDataTable").append(a),a.append($("<td>"+t.attributes["contact-name"]+"</td>")),a.append($("<td>"+t.attributes["laboratory-name"]+"</td>")),a.append($("<td>"+t.attributes.address1+"</td>")),a.append($("<td>"+t.attributes.address2+"</td>")),a.append($("<td>"+t.attributes.address3+"</td>")),a.append($("<td>"+t.attributes.city+"</td>")),a.append($("<td>"+t.attributes.postcode+"</td>"))}function getHowFarBackUrl(){return"undefined"!=typeof howFarBack?(params=howFarBack.textContent,pageUrl="https://localhost:3000/api/v1/laboratories/out_of_date/"+params,pageUrl):void 0}$.ajax({type:"GET",url:getHowFarBackUrl(),dataType:"json",success:function(t){drawTable(t)}});
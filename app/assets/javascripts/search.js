$(document).ready(function() {
	var client = new AlgoliaSearch("M8C8KR3O14", "413473a5cc6ffef3d645d1c1759f1275");
	var template = Hogan.compile('<div class="hit-auto-complete">' +
			'<div class="laboratory_name">{{{_highlightResult.laboratory_name.value}}}</div>' +
			'<div class="address1">{{{_highlightResult.address1.value}}}</div>' +
			'<div class="city">{{{_highlightResult.city.value}}}</div>' +
		'</div>');
	$('input#search-input').typeahead(null, {
		source: client.initIndex('Laboratory').ttAdapter(),
		displayKey: 'laboratory_name',
		templates: {
			suggestion: function(hit) {
				return template.render(hit);
			}
		}
	}).on('change', function(e) {
		console.log("onchange: " + $('input#laboratory_name').val());
	}).on('keypress', function(e) {
		if (e.which == 13) {
			console.log("onsubmit: " + $('input#laboratory_name').val());
		}
	}).on('typeahead:selected', function(e) {
		console.log("onselected: " + $('input#laboratory_name').val());
	});
	$('.search-terms a').click(function(e) {
		$("input#laboratory_name").typeahead('setQuery', $(this).text()).focus();
	})
});

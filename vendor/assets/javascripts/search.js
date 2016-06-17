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

	// INSTANTIATE MIXITUP

	$('#SearchResults').mixitup({
		layoutMode: 'list', // Start in list mode (display: block) by default
		listClass: 'list', // Container class for when in list mode
		gridClass: 'grid', // Container class for when in grid mode
		effects: ['fade','blur'], // List of effects
		listEffects: ['fade','rotateX'] // List of effects ONLY for list mode
	});

	// HANDLE LAYOUT CHANGES

	// Bind layout buttons to toList and toGrid methods:

	$('#ToList').on('click',function(){
		$('.button').removeClass('active');
		$(this).addClass('active');
		$('#SearchResults').mixitup('toList');
	});

	$('#ToGrid').on('click',function(){
		$('.button').removeClass('active');
		$(this).addClass('active');
		$('#SearchResults').mixitup('toGrid');
	});

	// HANDLE MULTI-DIMENSIONAL CHECKBOX FILTERING

	/*
	*	The desired behaviour of multi-dimensional filtering can differ greatly
	*	from project to project. MixItUp's built in filter button handlers are best
	*	suited to simple filter operations, so we will need to build our own handlers
	*	for this demo to achieve the precise behaviour we need.
	*/

	var $filters = $('#Filters').find('li'),
		dimensions = {
			city: 'all' // Create string for second dimension
		};

	// Bind checkbox click handlers:

	$filters.on('click',function(){
		var $t = $(this),
			dimension = $t.attr('data-dimension'),
			filter = $t.attr('data-filter'),
			filterString = dimensions[dimension];

		if(filter == 'all'){
			// If "all"
			if(!$t.hasClass('active')){
				// if unchecked, check "all" and uncheck all other active filters
				$t.addClass('active').siblings().removeClass('active');
				// Replace entire string with "all"
				filterString = 'all';
			} else {
				// Uncheck
				$t.removeClass('active');
				// Emtpy string
				filterString = '';
			}
		} else {
			// Else, uncheck "all"
			$t.siblings('[data-filter="all"]').removeClass('active');
			// Remove "all" from string
			filterString = filterString.replace('all','');
			if(!$t.hasClass('active')){
				// Check checkbox
				$t.addClass('active');
				// Append filter to string
				filterString = filterString == '' ? filter : filterString+' '+filter;
			} else {
				// Uncheck
				$t.removeClass('active');
				// Remove filter and preceeding space from string with RegEx
				var re = new RegExp('(\\s|^)'+filter);
				filterString = filterString.replace(re,'');
			};
		};

		// Set demension with filterString
		dimensions[dimension] = filterString;

		// We now have two strings containing the filter arguments for each dimension:
		console.info('dimension 1: '+dimensions.region);
		console.info('dimension 2: '+dimensions.recreation);

		/*
		*	We then send these strings to MixItUp using the filter method. We can send as
		*	many dimensions to MixitUp as we need using an array as the second argument
		*	of the "filter" method. Each dimension must be a space seperated string.
		*
		*	In this case, MixItUp will show elements using OR logic within each dimension and
		*	AND logic between dimensions. At least one dimension must pass for the element to show.
		*/

		$('#SearchResults').mixitup('filter',[dimensions.region, dimensions.recreation])
	});



});

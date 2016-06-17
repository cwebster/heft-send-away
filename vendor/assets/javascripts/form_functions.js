/* Webarch Admin Dashboard
/* This JS is only for DEMO Purposes - Extract the code that you need
-----------------------------------------------------------------*/
//Cool ios7 switch - Beta version
//Done using pure Javascript
$(document).ready(function(){
	  //Dropdown menu - select2 plug-in
	  $("#source").select2();

	  //Multiselect - Select2 plug-in
	  $("#multi").val(["Jim","Lucy"]).select2();

	  //Date Pickers
	  $('.input-append.date').datepicker({
				autoclose: true,
				todayHighlight: true
	   });

	 $('#dp5').datepicker();

	 $('#sandbox-advance').datepicker({
			format: "dd/mm/yyyy",
			startView: 1,
			daysOfWeekDisabled: "3,4",
			autoclose: true,
			todayHighlight: true
    });

});

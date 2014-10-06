# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`

$(document).ready(function() {

	

	$('#tool_inventory_type_id').change(function() {

		var value = $(this).children("option:selected").text();

		if (value === "Serialized") {
			$("#tool_quantity")
				.val(1)
				.prop("disabled", true);
		} else {
			$("#tool_quantity")
				.val("")
				.prop("disabled", false);
		};

	})

})


`
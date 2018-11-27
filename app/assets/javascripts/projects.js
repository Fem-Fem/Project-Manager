$(function() {
	$("a.load_comments").on("click", function (event) {
		$.ajax
	})
})


$(document).ready(function() {
	attachEventListeners()
})

const attachEventListeners = () => {
	$(".workers").on("click", function() {
		showWorkers();
	})
}

function showWorkers() {
	$.get("/workers")
	# fetch data
	# style data
	# render data
}


# Add form for creating more projects
# How does the spec file work?
# Implement it for project show and index page
# Form for submitting project done dynamicall?
# At least one of the JS Model Objects must have a method on the prototype.???
# Makes use of ES6 features as much as possible(e.g Arrow functions, Let & Const, Constructor Functions)?`
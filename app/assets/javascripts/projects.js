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
		// debugger
		showWorkers();
	})
}

function showWorkers() {
	$(".populateWorkers").text(	
		$.get("/workers", function(data) {
			data.map( x => [x.name, "/workers/" + x.id])
		// debugger;
		})
	)
}


// for each iteration, create div with info

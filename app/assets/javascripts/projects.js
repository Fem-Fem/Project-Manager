$(document).ready(function() {
	attachEventListeners()
})

const attachEventListeners = () => {
	$(".workers").on("click", function() {
		showWorkers();
	})
}

function showWorkers() {
	$.get("/workers", function(data) {
		data.map( x => [x.name, "/workers/" + x.id])
		for (var i = 0; i < data.length; i++) {
			debugger
			$(".populateWorkers").append(`<a href=${data[i].id}>${data[i].name}</a>`)
			linebreak = document.createElement("br")
			$(".populateWorkers").append(linebreak)
		}
	})
}

// create function to see if button has been clicked

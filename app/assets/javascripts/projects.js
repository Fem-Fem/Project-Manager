$(document).ready(function() {
	attachEventListeners()
})

const attachEventListeners = () => {
	$(".workers").on("click", function() {
		var clicked = wasClicked();
		if (clicked == true) {
			showWorkers();
		}
	})
}

function showWorkers() {
	$.get("/workers", function(data) {
		data.map( x => [x.name, "/workers/" + x.id])
		for (var i = 0; i < data.length; i++) {
			linebreak = document.createElement("br")
			$(".populateWorkers").append(`<a href=${data[i].id}>${data[i].name}</a>`)
			$(".populateWorkers").append(linebreak)
		}
		linebreak = document.createElement("br")
		$(".populateWorkers").append(linebreak)
		$(".populateWorkers").append(linebreak)
		$(".populateWorkers").append(linebreak)
	})
}

function wasClicked() {
	if ($(".populateWorkers")[0].children.length == 0) {
		return true;
	}
	return false;
}

// create function to see if button has been clicked

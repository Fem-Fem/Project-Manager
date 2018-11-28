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

	$(".NextWorker").on("click", function() {
		nextWorker();
	})
}

function showWorkers() {
	$.get("/workers", function(data) {
		data.map( x => [x.name, "/workers/" + x.id])
		for (var i = 0; i < data.length; i++) {
			linebreak = document.createElement("br")
			$(".populateWorkers").append(`<a href=/workers/${data[i].id}>${data[i].name}</a>`)
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

function nextWorker() {
	var currentWorker = parseInt($(".NextWorker").attr("worker-id"))
	$.get("/workers", function(data) {
		var length = data.length
		var nextWorker = data.slice(currentWorker)[0]
		$.get("/workers/" + nextWorker.id + ".json", function(data) {
			// unsure why this is not working
			$(".workerName").text(data["name"])
			$(".workerPosition").text(data["position"])
			$(".workerRating").text(data["rating"])
			$(".NextWorker").attr("worker-id", data["id"])
			debugger
		})
	})
}


// create check for last worker
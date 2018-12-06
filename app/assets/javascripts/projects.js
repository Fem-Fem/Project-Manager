$(document).ready(function() {
	attachEventListeners()
})

const attachEventListeners = () => {
	$("#projects-workers-button").on("click", function() {
		var clicked = wasClicked();
		if (clicked == true) {
			showWorkers();
		}
	})

	$(".NextWorker").on("click", function() {
		nextWorker();
	})

	$(".newProject").on("click", function(event) {
		event.preventDefault();
		newProject();
	})
}

function showWorkers() {
	$.get("/workers.json", function(data) {
		data.map( x => [x.name, "/workers/" + x.id])
		for (var i = 0; i < data.length; i++) {
			linebreak = document.createElement("br")
			$(".populateWorkers").append(`
				<div>
					<a href=/workers/${data[i].id}>${data[i].name}</a>
				</div>
				`)
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
	$.get("/workers.json", function(data) {
		debugger
		var length = data.length
		var nextWorker = data.slice(currentWorker)[0]
		$.get(`/workers/${nextWorker.id}.json`, function(data2) {
			// unsure why this is not working
			$(".workerName").text(data2["name"])
			$(".workerPosition").text(data2["position"])
			$(".workerRating").text(data2["rating"])
			debugger
			$(".workerCompany").text(data2["rating"])
			$(".NextWorker").attr("worker-id", data2["id"])
		})
	})
}

//
function newProject() {
	var values = $(this).serialize
	var posting = $.post('/projects', values)

	posting.done(function(data) {
		var project = data;
		$("#yo").text(project["name"])
		$("#ya").text(project["description"])	
	})
}


// create check for last worker
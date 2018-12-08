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

	$(".NextWorker").on("click", function(event) {
		event.preventDefault();
		event.stopPropagation();
		nextWorker();
	})

	$(".new_project").on("submit", function(event) {
		event.preventDefault();
		event.stopPropagation();
		debugger
		// thisdata = {
		// 	'authenticity_token': $("input[name='authenticity_token']").val(),
		// 	'project': {
		// 		'name': $("#project_name").val(),
		// 		'description': $("#project_description").val()
		// 	}
		// }
		jQuery.ajax({
			type: this.method,
			url: this.action,
			data: $(this).serialize(),
			success: function (response) {
				console.log(response)
				console.log("success")
				var $ol = $(".project-index-page")
				$ol.append(response)
			},
			error: function (response) {
				console.log(response)
				console.log("failure")
			}
		})

	})

	// $("#companies-project-list").on("click", function(event) {
	// 	event.preventDefault();
	// 	newProject();
	// })

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
		var length = data.length;
		if (data.slice(currentWorker)[0] == null) {
			var nextWorker = data[0];
		}
		else {
			var nextWorker = data.slice(currentWorker)[0];
		}
		$.getJSON(`/workers/${nextWorker.id}`, function(data2) {
			$(".workerName").text(data2["name"])
			$(".workerPosition").text(data2["position"])
			$(".workerRating").text(data2["rating"])
			$(".workerCompany").text(data2.company.name)
			$(".workerProject").text(data2.project.name)
			$(".NextWorker").attr("worker-id", data2["id"])
		})
	})
}


function showManyWorkers() {

}

function showManyProjects() {

}

function newProject(x) {

}

class Project {
	constructor(description, name){
		this.description = description;
		this.name = name;
	}
}

Project.prototype.highlight = function() {
	var today = new Date();
	return `<div>Created on ${today.getDate()}</div>`
}
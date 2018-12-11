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
		newProject(this)
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
	$.ajax({
		type: x.method,
		url: x.action,
		data: $(x).serialize(),
		dataType: "JSON"}).done(function(response) {
			debugger
			console.log(response)
			let data = response
			if (response.errors.name === undefined) {
				debugger
				var $ol = $(".allProjects")
				const project = new Project(response)
				// project.showDate(response)
				$ol.append(project.formatHTML());
			}
			else {
				// debugger
				$("#validation-error").text("Fail");				
			}
			})
		// })
		// success: function (response) {
// 		console.log(response)
// 		if (validations(response) == false) {
			// $(".project-form").empty();
			// $(".project-form").append(response);
// 		}
// 		else {
// 			// console.log(response)
			// var $ol = $(".allProjects")
			// $ol.append(response)
// 			$ol.append('hi')
// 			var name = $("#project_name").val()
// 			var description = $("#project_description").val()
// 			const project = new Project(name, description)
// 			// project.showDate(response)
// 		}
// 	}
	// })
}

class Project {
	constructor(attributes) {
		this.name = attributes.name;
		this.description = attributes.description;
	}
}

Project.prototype.showDate = function(this_response) {
	var today = new Date();
	var date = `${today.getMonth()}-${today.getDay()}-${today.getFullYear()}`
	var $ol = $(".allProjects")
	$ol.append("Say Hi!")
	$ol.append(`<div>Created on ${date}</div>`)
	console.log(date)
}

Project.prototype.formatHTML = function() {
	debugger
	$ol.append(`<div>Created on ${date}</div>`)
}






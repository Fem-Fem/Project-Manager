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
		newProject(this);
	})

	$("#companies-project-list").on("load", function(event) {
		showManyProjects();
	})

	$("#companies-worker-list").on("load", function(event) {
		showManyProjects();
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
	const urlArray = window.location.href.split("/")
	const length = urlArray.length
	const company_id = parseInt(urlArray[length-1])
	$.get("/workers.json", function(data) {
		for (var i = 0; i < data.length; i++) {
			if (data[i].company.id === company_id) {
				debugger
				linebreak = document.createElement("br")
				$("#companies-worker-list").append(`
					<div>
						<a href=/companies/${company_id}/workers/${data[i].id}>${data[i].name}</a>
						: ${data[i].position}
					</div>
					`)
				$("#companies-worker-list").append(linebreak)
			}
		}
	})
}

function showManyProjects() {

}

function newProject(x) {
	$.ajax({
		type: x.method,
		url: x.action,
		data: $(x).serialize(),
		dataType: "JSON"}).done(function(response) {
			console.log(response);
			let data = response;
			if (response.errors.name === undefined) {
				var $ol = $(".allProjects");
				const project = new Project(response);
				$ol.append(project.formatHTML());
			}
			else {
				$("#validation-error").text("Fail");				
			}
		})
	}

class Project {
	constructor(attributes) {
		this.name = attributes.name;
		this.description = attributes.description;
		this.id = attributes.id;
	}
}

Project.prototype.showDate = function(this_response) {
	var today = new Date();
	var date = `${today.getMonth()}-${today.getDay()}-${today.getFullYear()}`
	var $ol = $(".allProjects")
	$ol.append("Say Hi!")
	$ol.append(`<div>Created on ${date}</div>`)
	console.log(date);
}

Project.prototype.formatHTML = function() {
	return (`<div id = "project_${this.id}" class="project project-index-page">
					<ul>
						<li>
							<a href="/projects/${this.id}">${this.name}</a>: ${this.description}
						</li>
					</ul>
				</div>`);
}






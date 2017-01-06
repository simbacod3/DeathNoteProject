// [CLASSES]
function NodeObject(eventModel) {
	// [FIELDS]
	this.onNewBranch = false;
    this.previous = null;
    this.borderLeft = null;
    this.positionX = null;
    this.positionY = null;
    this.borderRight = null;
    this.next = null;
    // Add Event properties
	this.event = {}
	for (var key in eventModel) {
   		if (eventModel.hasOwnProperty(key)) {
       		this.event[key] = eventModel[key];
     	}
     }
}

//#region LineObject
function LineObject(name, colour) {
  	// [FIELDS]
  	this.items = [];
  	if (typeof colour === "string") {
  		this.color = colour;
	}
	else {
		console.log("Colour parameter should be a string");
		return null;
	}
	if (typeof name === "string") {
  		this.label = name.toLowerCase();
	}
	else {
		console.log("Name parameter should be a string");
		return null;
	}
  	var defaultX;
  	var defaultY;
}

	// [GETTER/SETTER]
	LineObject.prototype.setDefaultCoord = function(positionX, positionY){
  		if (Number.isInteger(positionX) && Number.isInteger(positionY)){
  			this.defaultX = positionX;
  			this.defaultY = positionY;
  		}
  	};
	LineObject.prototype.DefaultX = function(){
  		return this.defaultX;
  	};
	LineObject.prototype.DefaultY = function(){
  		return this.defaultY;
  	};

	// [METHODS]
	LineObject.prototype.getLastItem = function() {
  		if (this.items.length <= 0){
  			return null;
  		}
  		else {
  			return this.items[this.items.length - 1];
  		}
  	};

  	LineObject.prototype.addNode = function (newEvent){
  		if (newEvent instanceof NodeObject){
  			this.items[this.items.length] = newEvent;
  		}
  	};
//#endregion LineObject

//#region SVGDrawerObject
function SVGDrawerObject(line) {
	// [FIELDS]
	if (line instanceof LineObject){
		this.master = line;
	}
	else {
		return null;
	}
	var widthIntersection = 150;

	// [GETTER/SETTER]
	SVGDrawerObject.prototype.setIntersection = function(width){
		widthIntersection = width;
	};

	// [METHODS]
	SVGDrawerObject.prototype.drawNodeOn = function (node, line, svgNS){
	    // Positions
	    var startAt = null;
	    var nodePosition = null;
	    if (node.previous == null){
	      startAt = 0;
	      nodePosition = (startAt + line.DefaultX());
	    }
	    else if (node.onNewBranch){
	    	startAt = node.borderLeft;
	    	nodePosition = (startAt + line.DefaultX());
	    }
	    else {
	      var last = line.getLastItem();
	      if (last != null){
	      	startAt = last.borderRight;
	      	nodePosition = (node.previous.positionX + line.DefaultX() + line.DefaultX());
	      }
	      else {
	      	if (node.borderLeft != null){
	      		startAt = node.borderLeft;
	      		nodePosition = (startAt + line.DefaultX());
	      	}
	      	else {
	      		console.log("WHERE START FROM ?")
	      	}
	      }
	    }
	    var endAt = (nodePosition + line.DefaultX());

	    // TODO: change coord if date(dd/mm/yyyy) are equals >> space between node proportional with days

	    // SVG element
	    var element = document.createElementNS(svgNS, "g");
		var elementNS = element.namespaceURI;

		// Left connection
		var leftLink = document.createElementNS(elementNS, "path");
		leftLink.setAttribute("class","left-"+line.label+"line-node");
		leftLink.setAttribute("d", "M"+ startAt +" "+ line.DefaultY() +" L"+ nodePosition +" "+ line.DefaultY());
		leftLink.setAttribute("stroke", line.color);
		leftLink.setAttribute("stroke-width", 35);
		node.borderLeft = startAt;
		element.appendChild(leftLink);

		// Right connection
		var rightLink = document.createElementNS(elementNS, "path");
		rightLink.setAttribute("class","right-"+line.label+"line-node");
		rightLink.setAttribute("d","M"+nodePosition+" "+line.DefaultY()+" L"+endAt+" "+line.DefaultY());
		rightLink.setAttribute("stroke", line.color);
		rightLink.setAttribute("stroke-width", 35);
		node.borderRight= endAt;
		element.appendChild(rightLink);

		// Node
		var nodeSVG = document.createElementNS(elementNS, "g");
		var nodeNS = nodeSVG.namespaceURI;
		nodeSVG.setAttribute("class","svg-node-"+line.label);

		var border = document.createElementNS(nodeNS, "circle");
		border.setAttribute("class","svg-node-border");
		border.setAttribute("cx", nodePosition);
		border.setAttribute("cy", line.DefaultY());
		border.setAttribute("r", 25);
		border.setAttribute("stroke", "#ffffff");
		border.setAttribute("stroke-width", 1);
		border.setAttribute("fill", "#000000");
		nodeSVG.appendChild(border);

		var circle = document.createElementNS(nodeNS, "circle");
		circle.setAttribute("class","svg-node");
		circle.setAttribute("cx", nodePosition);
		circle.setAttribute("cy", line.DefaultY());
		circle.setAttribute("r", 20);
		circle.setAttribute("stroke", "#000000");
		circle.setAttribute("stroke-width", 5);
		circle.setAttribute("fill", "#ffffff");
		circle.setAttribute("onclick", "openModalDialog(event)");
		circle.setAttribute("nodeModal-identifier", node.event.id);
		node.positionX = nodePosition;
		node.positionY = line.DefaultY();
		nodeSVG.appendChild(circle);

		element.appendChild(nodeSVG);

		return element;
	};

	SVGDrawerObject.prototype.goToMaster = function (newNode, fromLine, svgNS){
		if (fromLine == this.master){
			console.log("Line is already Master");
			return null;
		}
		else if (fromLine.items.length == 0){
			console.log("Line doesn't contains any node. Can't reach Master");
			return null;
		}

		// SVG Element
		var element = document.createElementNS(svgNS, "g");
		var elementNS = element.namespaceURI;

		// Get last nodes
		var last = fromLine.getLastItem();
		var lastItem = newNode.previous;

		// Draw extensions
		if (last.borderRight < lastItem.borderRight){
			var line = document.createElementNS(elementNS, "path");
			line.setAttribute("class","right-"+fromLine.label+"line-extension");
			line.setAttribute("d","M"+last.borderRight+" "+last.positionY+" L"+lastItem.borderRight+" "+fromLine.DefaultY());
			line.setAttribute("stroke", fromLine.color);
			line.setAttribute("stroke-width", 35);
			line.setAttribute("fill", "transparent");
			last.borderRight = lastItem.borderRight;
			element.appendChild(line);
		}

		// Positions
		var linkLine= last.borderRight + (widthIntersection/5);
		var closeIntersection = (last.borderRight + widthIntersection);
		var linkNextNode = closeIntersection + (widthIntersection/5);

		// Config New Node
		newNode.onNewBranch = true;
		newNode.borderLeft = linkNextNode;

		// Merge Branch
		var branch = document.createElementNS(elementNS,"path");
		branch.setAttribute("class", "from-"+fromLine.label+"line-to-main");
		branch.setAttribute("d","M"+last.borderRight+" "+last.positionY+" H"+linkLine+" L"+closeIntersection+" "+this.master.DefaultY()+" H"+linkNextNode);
		branch.setAttribute("stroke", fromLine.color);
		branch.setAttribute("stroke-width", 35);
		branch.setAttribute("fill", "transparent");
		element.appendChild(branch);

		return element;
	};

	SVGDrawerObject.prototype.createBranchFor = function (newNode, line, svgNS){
		var last = this.master.getLastItem();

		// SVG Element
		var element = document.createElementNS(svgNS, "g");
		var elementNS = element.namespaceURI;

		// Positions
		var linkMaster = last.borderRight + (widthIntersection/5);
		var startNewBranch = (last.borderRight + widthIntersection);
		var linkNextNode = startNewBranch + (widthIntersection/5);

		// Config Node to insert on a new branch
		newNode.onNewBranch = true;
		newNode.borderLeft = linkNextNode;

		// New Branch
		var branch = document.createElementNS(elementNS,"path");
		branch.setAttribute("class","new-branch-"+line.label+"line");
		branch.setAttribute("d","M"+last.borderRight+" "+last.positionY+" H"+linkMaster+" L"+startNewBranch+" "+line.DefaultY()+" H"+linkNextNode);
		branch.setAttribute("stroke", line.color);
		branch.setAttribute("stroke-width", 35);
		branch.setAttribute("fill", "transparent");
		element.appendChild(branch);

		return element;
	};
}

// [VARIABLES]
	var timeLine = new LineObject("general","#742574");
	var redLine = new LineObject("kira","#ab1606");
	var blueLine = new LineObject("police","#0c2e7b");

	var lastRedNode = null;
	var lastBlueNode = null;

	var eventItemsJava = [];

// [METHODS]
	function readJavaList() {
		let eventItems = eventItemsJava;
		return eventItems;
	}

	function addToJavaList(NodeObject) {
		if(eventItemsJava.length == 0) {
			eventItemsJava.push(NodeObject);
			return;
		} else {
			let lastel = eventItemsJava.pop();
			NodeObject.previous = lastel;
			lastel.next = NodeObject;
			eventItemsJava.push(lastel);
			eventItemsJava.push(NodeObject);
		}
	}

	function mockReadJavaList(){
		var eventItems = [];
		var eventKira = {
			"date":"12/12/2003",
			"pointOfView":"kira",
			"description":"kira est un tueur"
		}
		var eventPolice = {
			"date":"12/02/2003",
			"pointOfView":"police",
			"description":"police veut arreter kira"
		}
		var eventGeneral = {
			"date":"12/11/2003",
			"pointOfView":null,
			"description":"jour de noel"
		}
		eventItems[0] = new NodeObject(eventGeneral);

		eventItems[1] = new NodeObject(eventGeneral);
		eventItems[1].previous = eventItems[0];
		eventItems[1].previous.next = eventItems[1];

		eventItems[2] = new NodeObject(eventKira);
		eventItems[2].previous = eventItems[1];
		eventItems[2].previous.next = eventItems[2];

		eventItems[3] = new NodeObject(eventPolice);
		eventItems[3].previous = eventItems[2];
		eventItems[3].previous.next = eventItems[3];

		eventItems[4] = new NodeObject(eventPolice);
		eventItems[4].previous = eventItems[3];
		eventItems[4].previous.next = eventItems[4];

		eventItems[5] = new NodeObject(eventKira);
		eventItems[5].previous = eventItems[4];
		eventItems[5].previous.next = eventItems[5];

		eventItems[6] = new NodeObject(eventGeneral);
		eventItems[6].previous = eventItems[5];
		eventItems[6].previous.next = eventItems[6];

		eventItems[7] = new NodeObject(eventPolice);
		eventItems[7].previous = eventItems[5];
		eventItems[7].previous.next = eventItems[6];

		eventItems[8] = new NodeObject(eventKira);
		eventItems[8].previous = eventItems[7];
		eventItems[8].previous.next = eventItems[8];

		eventItems[9] = new NodeObject(eventKira);
		eventItems[9].previous = eventItems[8];
		eventItems[9].previous.next = eventItems[9];

		eventItems[10] = new NodeObject(eventGeneral);
		eventItems[10].previous = eventItems[9];
		eventItems[10].previous.next = eventItems[10];

		return eventItems;
	}
	function onWhichLineIs(node) {
     	if (node instanceof NodeObject)
     	{
     		if (node.positionY == timeLine.DefaultY){
     			return timeLine.label;
     		}
     		else if (node.positionY == redLine.DefaultY){
     			return redLine.label;
     		}
     		else if (node.positionY == blueLine.DefaultY){
     			return blueLine.label;
     		}
     		else {
     			console.log("Line unknown");
     		}
     	}
     	else {
     		console.log("You can use onWhichLineIs() only on NodeObject instance")
     	}
     }

	function constructTimeline(){
		// Create Elements
		var eventItems = readJavaList();
		//var eventItems = mockReadJavaList();

		// Config Default Position for new Node
		var heightWindow = window.innerHeight;
		var defaultPosition = 300; //heightWindow / 5;
		timeLine.setDefaultCoord(100,defaultPosition);
		redLine.setDefaultCoord(100,defaultPosition - 200);
		blueLine.setDefaultCoord(100,defaultPosition + 200);

		// Drawing SVG
		var svgDrawer = new SVGDrawerObject(timeLine);
		var svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
		var svgNS = svg.namespaceURI;
		if (svgDrawer != null && svgDrawer instanceof SVGDrawerObject)
		{
			for (var eventItem of eventItems){
				console.log(eventItem);
				if (eventItem.event.pointOfView == null){
					if (eventItem.previous == null  || lastRedNode == lastBlueNode){
						var nodeSVG = svgDrawer.drawNodeOn(eventItem,timeLine,svgNS);
						console.log("timeline has "+ timeLine.items.length +"child");
						timeLine.addNode(eventItem);
						console.log("timeline has "+ timeLine.items.length +"child")
						svg.appendChild(nodeSVG);
					}
					else {
						var redBranchSVG = svgDrawer.goToMaster(eventItem,redLine,svgNS);
						var blueBranchSVG = svgDrawer.goToMaster(eventItem,blueLine,svgNS); // To check if we have to use eventItem for both or if it should be different
						var nodeSVG = svgDrawer.drawNodeOn(eventItem,timeLine,svgNS);
						timeLine.addNode(eventItem);
						svg.appendChild(redBranchSVG);
						svg.appendChild(blueBranchSVG);
						svg.appendChild(nodeSVG);
					}
					//lastNode = eventItem;
					lastRedNode = eventItem;
					lastBlueNode = eventItem;
				}
				else if  (eventItem.event.pointOfView.toLowerCase() == "kira") {
					var nodeSVG;
					if (lastRedNode == lastBlueNode || (redLine.getLastItem() == null || (redLine.getLastItem().positionX < timeLine.getLastItem().positionX))){
						var redBranchSVG = svgDrawer.createBranchFor(eventItem, redLine, svgNS);
						nodeSVG = svgDrawer.drawNodeOn(eventItem, redLine, svgNS);
						redLine.addNode(eventItem);
						console.log("redLine has "+ redLine.items.length +"child")
						svg.appendChild(redBranchSVG);
					}
					else {
						nodeSVG = svgDrawer.drawNodeOn(eventItem, redLine, svgNS);
						redLine.addNode(eventItem);
						console.log("redLine has "+ redLine.items.length +"child")
					}
					svg.appendChild(nodeSVG);
					lastRedNode = eventItem;
				}
				else if  (eventItem.event.pointOfView.toLowerCase() == "police") {
					var nodeSVG;
					if (lastRedNode == lastBlueNode || (blueLine.getLastItem() == null || (blueLine.getLastItem().positionX < timeLine.getLastItem().positionX))){
						var blueBranchSVG = svgDrawer.createBranchFor(eventItem, blueLine, svgNS);
						nodeSVG = svgDrawer.drawNodeOn(eventItem, blueLine, svgNS);
						blueLine.addNode(eventItem);
						console.log("blueLine has "+ blueLine.items.length +"child")
						svg.appendChild(blueBranchSVG);
					}
					else if (blueLine.getLastItem() == null || blueLine.getLastItem().positionX < timeLine.getLastItem().positionX){

					}
					else {
						nodeSVG = svgDrawer.drawNodeOn(eventItem, blueLine, svgNS);
						blueLine.addNode(eventItem);
						console.log("blueLine has "+ blueLine.items.length +"child")
					}
					svg.appendChild(nodeSVG);
					lastBlueNode = eventItem;
				}
			}
			var lastItem = eventItems[eventItems.length - 1];
			var width = lastItem.borderRight + 100;
			var height;
			if(redLine.DefaultY() < blueLine.DefaultY()){
				height = blueLine.DefaultY() + 100;
			}
			else if (blueLine.DefaultY() < redLine.DefaultY()){
				height = redLine.DefaultY() + 100;
			}
			else {
				console.log("Default Coord Y is the same for both lines");
				height = window.innerHeight;
			}
			svg.setAttribute("width",width); // to make zoomable
			svg.setAttribute("border", 0);
			svg.setAttribute("viewBox", "0 0 "+width+" "+height);
		}
		return svg;
	}

	function drawTimeline(){
		var svgTimeLine = constructTimeline();
		var divTimeLine = document.getElementById("timeline-deathnote");
		divTimeLine.appendChild(svgTimeLine);
	}

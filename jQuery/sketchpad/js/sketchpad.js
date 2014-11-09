maxSize = 480;
var safeColors = ['00','33','66','99','cc','ff'];

var rand = function() {
    return Math.floor(Math.random()*6);
};

var newColor = function() {
	var r, g, b;

    r = safeColors[rand()];
    g = safeColors[rand()];
    b = safeColors[rand()];

    return "#"+r+g+b;
};

$(document).ready(function() {
	newPadWithSize(16);
});

function makeGrid(size) {
	blocks = "";
	for (i = 1; i <= size; i++) {
		for (j = 1; j <= size; j++) {
			blocks = blocks + "<div class='block'></div>";
		}
		blocks = blocks + "<br>"
	}	
	return blocks;
}

function removeBlocks() {
	$("#blocks").remove();
}

function newPad() {
	removeBlocks();	
	numberBlocks = prompt("How many blocks do you want?");
	newPadWithSize(numberBlocks);
}

function newPadWithSize(size) {
	removeBlocks();	
	blockSize = maxSize / size;
	$("#wrapper").append("<div id='blocks'></div>");
	$("#blocks").append(makeGrid(size));

	$(".block").css("width", blockSize);
	$(".block").css("height", blockSize);

	$(".block").on("mouseenter", function() {
		oldColor = $(this).css("background-color");
		if (oldColor == "rgb(255, 255, 255)") {
			$(this).css("background-color", newColor());
		} else {
			currentOpacity = $(this).css("opacity");
			if (currentOpacity > 0)  {
				newOpacity = currentOpacity - 0.1;	
				if (newOpacity < 0) newOpacity = 0;
				$(this).css("opacity", newOpacity);
			}
		}
	});

/*	$(".block").hover(
		function() {
			oldColor = $(this).css("background-color");
			$(this).css("background-color", newColor(oldColor));
		}
	);
*/}
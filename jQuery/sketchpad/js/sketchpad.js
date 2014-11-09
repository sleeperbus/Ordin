maxSize = 480;
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

	$(".block").hover(
		function() {
			$(this).addClass("hover");	
		}
	);
}
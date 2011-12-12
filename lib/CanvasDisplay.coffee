class CanvasDisplay
	# <canvas id="canvas" width="200" height="200"></canvas>
	# <script>
	# var ctx = document.getElementById('canvas').getContext('2d');
	# ctx.fillStyle = 'rgba(0,0,0,1)';
	# 
	# var point = function (x, y) {
	#   ctx.fillRect(x, y, 1, 1);
	# }
	# 
	# var canvasDisplay = {
	# 	notify: function (message, observable) {
	# 		var dup = new World(observable.grid);
	# 
	# 		setTimeout(function () {
	# 			ctx.clearRect(0,0,200,200);
	# 			dup.grid.forEach(function (row, y) {
	# 				row.forEach(function (cell, x) {
	# 					if (cell.alive) {
	# 						point(x, y);
	# 					}
	# 				});
	# 			});
	# 		}, 10);
	# 	}
	# };

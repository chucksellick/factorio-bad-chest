var fs = require("fs");
var path = require("path");

var gulp = require('gulp');

var srcPath = "src/**/*";
var modPath = "~/Library/Application Support/factorio/mods"
var buildPath = path.join(modPath, "bad-chest_0.0.1");
gulp.task('default', function() {
	return gulp.src(srcPath)
		.pipe(gulp.dest(buildPath));
});
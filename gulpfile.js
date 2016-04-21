var process = require("process");
var fs = require("fs");
var path = require("path");

var gulp = require('gulp');

var srcPaths = ["src/**/*.lua", "src/**/*.png", "src/**/*.json", "src/**/*.cfg"];

gulp.task('devBuild', function() {

  var infoJson = require("./src/info.json");
  var homePath = process.env[(process.platform === 'win32') ? 'USERPROFILE' : 'HOME'];
  var appPath = (process.platform === 'win32') ? "AppData\\Roaming\\Factorio" : "Library/Application Support/factorio";

  var factorioPath = path.join(homePath, appPath);

  if (!fs.existsSync(factorioPath)) {
    throw new Error("Factorio not found at: " + factorioPath + "\nPlease configure correct Factorio base path in config.js");
  }

  var modPath = path.join(factorioPath, "mods");
  var buildPath = path.join(modPath, infoJson.name + "_" + infoJson.version);

  return gulp.src(srcPaths)
    .pipe(gulp.dest(buildPath));
});

gulp.task("devWatch", function() {
  gulp.watch(srcPaths, ["devBuild"]);
})

gulp.task('default', ["devBuild", "devWatch"]);

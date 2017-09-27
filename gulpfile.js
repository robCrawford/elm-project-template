
var gulp = require('gulp'),
    elm = require('gulp-elm'),
    gutil = require('gulp-util'),
    uglify = require('gulp-uglify'),
    sass = require('gulp-sass'),
    livereload = require('gulp-livereload'),
    serverFactory = require('spa-server');

function errorHandler(err) {
    gutil.beep();
    this.emit('end');
}

gulp.task('webserver', function () {
    serverFactory.create({
        path: './public',
        port: 8080,
        fallback: '/index.html'
    })
    .start();
});

gulp.task('elm', function() {
    return gulp.src('./src/elm/Main.elm')
        .pipe(elm.bundle('elm-bundle.js', { warn: true, debug: true }))
        .on('error', errorHandler)
        .pipe(uglify())
        .pipe(gulp.dest('./public/js/'))
        .pipe(livereload());
});

gulp.task('sass', function () {
    return gulp.src('./src/sass/**/*.scss')
        .pipe(sass({ outputStyle: 'compressed' })
            .on('error', sass.logError))
        .on('error', errorHandler)
        .pipe(gulp.dest('./public/css'))
        .pipe(livereload());
});

gulp.task('default', ['webserver', 'elm', 'sass'],  function() {
    livereload.listen();
    gulp.watch('./src/elm/**/*.elm', ['elm']);
    gulp.watch('./src/sass/**/*.scss', ['sass']);
});

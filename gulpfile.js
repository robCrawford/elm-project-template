
var gulp = require('gulp'),
    elm = require('gulp-elm'),
    livereload = require('gulp-livereload'),
    serverFactory = require('spa-server');

function onError(err) {
    console.log(err.toString());
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
    return gulp.src('src/Main.elm')
        .pipe(elm())
        .on('error', onError)
        .pipe(gulp.dest('public/js/'))
        .pipe(livereload());
});

gulp.task('default', ['webserver', 'elm'],  function() {
    livereload.listen();
    gulp.watch('src/**/*.elm', ['elm']);
});

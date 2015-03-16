gulp   = require 'gulp'
shell  = require 'gulp-shell'
coffee = require 'gulp-coffee'
sass   = require 'gulp-sass'
jade   = require 'gulp-react-jade'
watchify = require 'gulp-watchify'

gulp.task 'default', ['build']
gulp.task 'build', [
  'build:ts'
  'build:coffee'
  'build:jade'
  'build:css'
]

gulp.task 'build:ts', shell.task [
  '$(npm bin)/tsc -d -m commonjs  --preserveConstEnums -t es5 --sourceMap --outDir lib src/entry.ts'
]

gulp.task 'build:coffee', ->
  gulp.src('src/**/*.coffee')
    .pipe(coffee())
    .pipe(gulp.dest('lib'))

gulp.task 'build:jade', ->
  gulp.src('src/**/*.jade')
    .pipe jade()
    .pipe(gulp.dest('lib'))

gulp.task 'build:css', ->
  gulp
    .src('src/styles/style.scss')
    .pipe(sass())
    .pipe(gulp.dest('public'))

gulp.task 'build:web', shell.task [
  '$(npm bin)/browserify -o public/bundle.js lib/index.js'
]

watching = false
gulp.task 'enable-watch-mode', -> watching = true
gulp.task 'browserify', watchify (watchify) ->
  gulp.src 'lib/index.js'
    .pipe watchify
      watch: watching
    .pipe gulp.dest 'public/js/bundle.js'

gulp.task 'watchify', ['enable-watch-mode', 'browserify']
gulp.task 'watch', ['build', 'enable-watch-mode', 'watchify'], ->
  gulp.watch 'src/**/*.coffee', ['build:coffee']
  gulp.watch 'src/**/*.ts', ['build:ts']
  gulp.watch 'src/**/*.jade', ['build:jade']
  gulp.watch 'src/styles/**/*.scss', ['build:css']


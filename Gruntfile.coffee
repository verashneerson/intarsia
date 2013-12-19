module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    clean: ["dist/", "app/css"]
    jshint:
      files: ["app/js/**/*.js"]
      options:
        boss: true
        browser: true
        shadow: true
      globals:
        jQuery: true
        Backbone: true
        _: true
        $: true

    modernizr:
      # [REQUIRED] Path to the build you're using for development.
      "devFile" : "app/vendor/modernizr/modernizr.js"
      # [REQUIRED] Path to save out the built file.
      "outputFile" : "app/vendor/modernizr/modernizr-custom.js"
      # Based on default settings on http://modernizr.com/download/
      "extra" :
          "shiv" : true
          "printshiv" : false
          "load" : true
          "mq" : false
          "cssclasses" : true

      # Based on default settings on http://modernizr.com/download/
      "extensibility" :
          "addtest" : false
          "prefixed" : false
          "teststyles" : false
          "testprops" : false
          "testallprops" : false
          "hasevents" : false
          "prefixes" : false
          "domprefixes" : false

      # By default, this task will crawl your project for references to Modernizr tests.
      # Set to false to disable.
      "parseFiles" : true

      # When parseFiles = true, this task will crawl all *.js, *.css, *.scss files, except files that are in node_modules/.
      # You can override this by defining a "files" array below.
      "files" : ['app/js/**/*.js', 'app/sass/**/*.scss']

      # When parseFiles = true, matchCommunityTests = true will attempt to
      # match user-contributed tests.
      "matchCommunityTests" : false

      # Have custom Modernizr tests? Add paths to their location here.
      "customTests" : []

    requirejs:
      release:
        options:
          baseUrl: "app/js"
          mainConfigFile: 'app/js/main.js'
          out: 'dist/js/main.js'
          name: 'main'
          optimize: 'uglify2'

          generateSourceMaps: true
          findNestedDependencies: true
          wrap: true
          preserveLicenseComments: false
          include: ["main"]

          paths:
            jquery: 'empty:'
            underscore: 'empty:'
            backbone: 'empty:'
            handlebars: 'empty:'
            bootstrap: 'empty:'

    sass:
      release:
        options:
          compass: true
        files: [
            expand: true
            cwd: 'app/sass/'
            src: ['*.scss']
            dest: 'app/css/'
            ext: '.css'
        ]

    cssmin:
      release:
        options:
          keepSpecialComments: false
        files:
          "dist/css/screen.css": ["app/css/screen.css"]
          "dist/css/print.css": ["app/css/print.css"]

    copy:
      release:
        files: [
          {
            expand: true
            cwd: 'app/'
            src: ['images/**', '*.html']
            dest: 'dist/'
          }
          {
            # only copies fallback vendor JS files
            expand: true
            cwd: 'app/'
            src: [
              'vendor/jquery/jquery.min.js'
              'vendor/underscore/underscore-min.js'
              'vendor/backbone/backbone-min.js'
              'vendor/handlebars/handlebars.amd.min.js'
              'vendor/bootstrap/dist/js/bootstrap.min.js'
              'vendor/requirejs/require.js'
            ]
            dest: 'dist/'
          }
        ]

    'http-server':
      dev:
        root: 'app/'
        port: 8080
        host: 'localhost'
        showDir: true
        autoIndex: true
        defaultExt: 'html'
        cache: 0  # seconds
      test:
        root: 'test/'
        port: 8081
        host: 'localhost'
        showDir: true
        autoIndex: true
        defaultExt: 'html'
        cache: 10
      dist:
        root: 'dist/'
        port: 8082
        host: 'localhost'
        showDir: true
        autoIndex: true
        defaultExt: 'html'
        cache: 600

  grunt.loadNpmTasks 'grunt-contrib-clean'
  #grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'

  #grunt.loadNpmTasks 'grunt-contrib-compress'

  grunt.loadNpmTasks 'grunt-modernizr'
  grunt.loadNpmTasks 'grunt-bbb-requirejs'
  grunt.loadNpmTasks 'grunt-http-server'


  grunt.registerTask 'default', [
    'clean'
    #'jshint'
    'modernizr'
    'requirejs'
    'sass'
    'cssmin'
    'copy'
  ]

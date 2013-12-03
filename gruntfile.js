module.exports = function(grunt) {
  grunt.initConfig({
    pkg:grunt.file.readJSON('package.json'),
    coffee: {
      compile: {
        files: {

        }
      }
    },
    sass: {
      compile: {
        files: {

        }
      }
    }
  });
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.registerTask('default', ['coffee', 'less']);
}

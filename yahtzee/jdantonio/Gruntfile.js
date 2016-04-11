// For building and testing Golang
var shell = require('shelljs');

/*global module:false*/
module.exports = function(grunt) {

  // For building and testing Golang
  function shellexec(cmd) {
    var result = shell.exec(cmd);
    if (result.code != 0) {
      grunt.fail.warn(result.stderr, result.code)
    }
  }

  // Project configuration
  grunt.initConfig({
    // Task configuration
    eslint: {
      options: {
        configFile: '.eslintrc.json'
      },
      target: ['lib/**/*.js', 'test/**/*.js']
    },
    nodeunit: {
      files: ['test/**/*_test.js']
    }
  });

  // These plugins provide necessary tasks
  grunt.loadNpmTasks('grunt-contrib-nodeunit');
  grunt.loadNpmTasks('grunt-eslint');

  // JavaScript task aliases
  grunt.registerTask('lint', 'perform static analysis of the JavaScript code', ['eslint']);
  grunt.registerTask('test', 'unit test the JavaScript implementation', ['nodeunit']);

  // Golang tasks
  grunt.registerTask('go:test', 'unit test the golang implementation', function() {
    shellexec('go test -v golang/*');
  });

  grunt.registerTask('go:vet', 'perform static analysis of the the golang code', function() {
    shellexec('go tool vet --all -v golang');
  });

  // Default tasks
  grunt.registerTask('go', ['go:vet', 'go:test']);
  grunt.registerTask('default', ['lint', 'test']);
  grunt.registerTask('all', ['default', 'go']);
};
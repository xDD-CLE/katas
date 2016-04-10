/*global module:false*/
module.exports = function(grunt) {

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

  // Default tasks
  grunt.registerTask('default', ['lint', 'test']);
};
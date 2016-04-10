var yahtzee = require('../lib/yahtzee.js');

exports.testTriangle = function(test) {
  var expected = 'foo';
  var actual = yahtzee.foo();
  test.equal(expected, actual);
  test.done();
};

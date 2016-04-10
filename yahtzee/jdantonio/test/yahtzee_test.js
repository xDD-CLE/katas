var yahtzee = require('../lib/yahtzee.js');

exports.testOnesRuleWithZeroOnes = function(test) {
  var expected = 0;
  var actual = yahtzee.score('ones', [2, 3, 4, 5, 6]);
  test.equal(expected, actual);
  test.done();
};

exports.testOnesRuleWithSomeOnes = function(test) {
  var expected = 3;
  var actual = yahtzee.score('ones', [1, 2, 1, 4, 1]);
  test.equal(expected, actual);
  test.done();
};

exports.testOnesRuleWithAllOnes = function(test) {
  var expected = 5;
  var actual = yahtzee.score('ones', [1, 1, 1, 1, 1]);
  test.equal(expected, actual);
  test.done();
};

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

exports.testTwosRuleWithZeroTwos = function(test) {
  var expected = 0;
  var actual = yahtzee.score('Twos', [1, 3, 4, 5, 6]);
  test.equal(expected, actual);
  test.done();
};

exports.testTwosRuleWithSomeTwos = function(test) {
  var expected = 4;
  var actual = yahtzee.score('Twos', [1, 2, 3, 4, 2]);
  test.equal(expected, actual);
  test.done();
};

exports.testTwosRuleWithAllTwos = function(test) {
  var expected = 10;
  var actual = yahtzee.score('Twos', [2, 2, 2, 2, 2]);
  test.equal(expected, actual);
  test.done();
};

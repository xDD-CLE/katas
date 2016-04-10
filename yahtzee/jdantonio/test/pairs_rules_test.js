var yahtzee = require('../lib/yahtzee.js');

exports.testPairRuleNoPairs = function(test) {
  var expected = 0;
  var actual = yahtzee.score('Pair', [1, 2, 3, 4, 5]);
  test.equal(expected, actual);
  test.done();
};

exports.testPairRuleOnePair = function(test) {
  var expected = 8;
  var actual = yahtzee.score('Pair', [1, 4, 2, 3, 4]);
  test.equal(expected, actual);
  test.done();
};

exports.testPairRuleTwoPairs = function(test) {
  var expected = 8;
  var actual = yahtzee.score('Pair', [3, 1, 3, 4, 4]);
  test.equal(expected, actual);
  test.done();
};

exports.testPairRulePairWithLowerTriple = function(test) {
  var expected = 8;
  var actual = yahtzee.score('Pair', [3, 3, 3, 4, 4]);
  test.equal(expected, actual);
  test.done();
};

exports.testPairRulePairWithHigherTriple = function(test) {
  var expected = 8;
  var actual = yahtzee.score('Pair', [6, 6, 6, 4, 4]);
  test.equal(expected, actual);
  test.done();
};

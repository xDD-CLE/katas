var yahtzee = require('../lib/yahtzee.js');

exports.testOnesRuleWithZeroOnes = function(test) {
  var expected = 0;
  var actual = yahtzee.score('Ones', [2, 3, 4, 5, 6]);
  test.equal(expected, actual);
  test.done();
};

exports.testOnesRuleWithSomeOnes = function(test) {
  var expected = 3;
  var actual = yahtzee.score('Ones', [1, 2, 1, 4, 1]);
  test.equal(expected, actual);
  test.done();
};

exports.testOnesRuleWithAllOnes = function(test) {
  var expected = 5;
  var actual = yahtzee.score('Ones', [1, 1, 1, 1, 1]);
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

exports.testThreesRuleWithZeroThrees = function(test) {
  var expected = 0;
  var actual = yahtzee.score('Threes', [1, 2, 4, 5, 6]);
  test.equal(expected, actual);
  test.done();
};

exports.testThreesRuleWithSomeThrees = function(test) {
  var expected = 6;
  var actual = yahtzee.score('Threes', [1, 3, 1, 3, 1]);
  test.equal(expected, actual);
  test.done();
};

exports.testThreesRuleWithAllThrees = function(test) {
  var expected = 15;
  var actual = yahtzee.score('Threes', [3, 3, 3, 3, 3]);
  test.equal(expected, actual);
  test.done();
};

exports.testFoursRuleWithZeroFours = function(test) {
  var expected = 0;
  var actual = yahtzee.score('Fours', [1, 2, 3, 5, 6]);
  test.equal(expected, actual);
  test.done();
};

exports.testFoursRuleWithSomeFours = function(test) {
  var expected = 12;
  var actual = yahtzee.score('Fours', [4, 1, 4, 1, 4]);
  test.equal(expected, actual);
  test.done();
};

exports.testFoursRuleWithAllFours = function(test) {
  var expected = 20;
  var actual = yahtzee.score('Fours', [4, 4, 4, 4, 4]);
  test.equal(expected, actual);
  test.done();
};

exports.testFivesRuleWithZeroFives = function(test) {
  var expected = 0;
  var actual = yahtzee.score('Fives', [1, 2, 3, 4, 6]);
  test.equal(expected, actual);
  test.done();
};

exports.testFivesRuleWithSomeFives = function(test) {
  var expected = 10;
  var actual = yahtzee.score('Fives', [1, 1, 1, 5, 5]);
  test.equal(expected, actual);
  test.done();
};

exports.testFivesRuleWithAllFives = function(test) {
  var expected = 25;
  var actual = yahtzee.score('Fives', [5, 5, 5, 5, 5]);
  test.equal(expected, actual);
  test.done();
};

exports.testSixesRuleWithZeroSixes = function(test) {
  var expected = 0;
  var actual = yahtzee.score('Sixes', [1, 2, 3, 4, 5]);
  test.equal(expected, actual);
  test.done();
};

exports.testSixesRuleWithSomeSixes = function(test) {
  var expected = 24;
  var actual = yahtzee.score('Sixes', [1, 6, 6, 6, 6]);
  test.equal(expected, actual);
  test.done();
};

exports.testSixesRuleWithAllSixes = function(test) {
  var expected = 30;
  var actual = yahtzee.score('Sixes', [6, 6, 6, 6, 6]);
  test.equal(expected, actual);
  test.done();
};

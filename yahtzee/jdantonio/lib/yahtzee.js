/*eslint no-console: ["error", { allow: ["log"] }] */

function sumForNumberRule(number, dice) {
  return dice.reduce(function(previousValue, currentValue/*, currentIndex, array*/) {
    if (currentValue === number) {
      previousValue += number;
    }
    return previousValue;
  }, 0);
}

module.exports.score = function(rule, dice) {
  var score = -1;

  switch (rule.toLowerCase()) {
  case 'ones':
    score = sumForNumberRule(1, dice);
    break;
  case 'twos':
    score = sumForNumberRule(2, dice);
    break;
  case 'threes':
    score = sumForNumberRule(3, dice);
    break;
  case 'fours':
    score = sumForNumberRule(4, dice);
    break;
  case 'fives':
    score = sumForNumberRule(5, dice);
    break;
  case 'sixes':
    score = sumForNumberRule(6, dice);
    break;
  }

  return score;
};

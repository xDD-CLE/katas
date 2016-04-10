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
  var score = 0;

  switch (rule.toLowerCase()) {
  case 'ones':
    score = sumForNumberRule(1, dice);
    break;
  case 'twos':
    score = sumForNumberRule(2, dice);
    break;
  }

  return score;
};

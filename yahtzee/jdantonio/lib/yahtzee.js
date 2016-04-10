/*eslint no-console: ["error", { allow: ["log"] }] */

function onesScore(dice) {
  return dice.reduce(function(previousValue, currentValue/*, currentIndex, array*/) {
    if (currentValue === 1) {
      previousValue++;
    }
    return previousValue;
  }, 0);
}

function twosScore(dice) {
  return dice.reduce(function(previousValue, currentValue/*, currentIndex, array*/) {
    if (currentValue === 2) {
      previousValue += 2;
    }
    return previousValue;
  }, 0);
}

module.exports.score = function(rule, dice) {
  var score = 0;

  switch (rule.toLowerCase()) {
  case 'ones':
    score = onesScore(dice);
    break;
  case 'twos':
    score = twosScore(dice);
    break;
  }

  return score;
};

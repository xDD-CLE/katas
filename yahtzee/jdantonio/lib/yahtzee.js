/*eslint no-console: ["error", { allow: ["log"] }] */

var rules = new Map();
rules.set('ones', (dice) => { return sumForNumberRule(1, dice); });
rules.set('twos', (dice) => { return sumForNumberRule(2, dice); });
rules.set('threes', (dice) => { return sumForNumberRule(3, dice); });
rules.set('fours', (dice) => { return sumForNumberRule(4, dice); });
rules.set('fives', (dice) => { return sumForNumberRule(5, dice); });
rules.set('sixes', (dice) => { return sumForNumberRule(6, dice); });
rules.set('pair', pairRule);

function sumForNumberRule(number, dice) {
  return dice.reduce(function(previousValue, currentValue/*, currentIndex, array*/) {
    if (currentValue === number) {
      previousValue += number;
    }
    return previousValue;
  }, 0);
}

function pairRule(/*dice*/) {
  console.log('\nBoom!');
}

module.exports.score = function(rule, dice) {
  var score = -1;
  var func = rules.get(rule.toLowerCase());

  if (func) {
    score = func(dice);
  }

  return score;
};

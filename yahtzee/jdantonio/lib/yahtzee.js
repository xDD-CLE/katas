/*eslint no-console: ["error", { allow: ["log"] }] */

module.exports.score = function(rule, dice) {
  return dice.reduce(function(previousValue, currentValue/*, currentIndex, array*/) {
    if (currentValue === 1) {
      previousValue++;
    }
    return previousValue;
  }, 0);
};

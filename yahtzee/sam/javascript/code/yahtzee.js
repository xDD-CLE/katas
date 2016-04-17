import R from 'ramda'

const scoreUpper = scoreVal => R.compose(
  R.sum, 
  R.filter(R.equals(scoreVal))
)

export const scoreOnes = scoreUpper(1)
export const scoreTwos = scoreUpper(2)

const diceCounts = R.countBy(R.identity)
const diceCountsWith = predicate => R.compose(
  R.filter(predicate), 
  diceCounts
)

const diceWithAtleast = count => R.compose(Object.keys, diceCountsWith(c => c >= count))
 
const totalKinds = reducer => ofAKind => R.compose(
  R.reduce(reducer, 0),
  R.map(n => parseInt(n)*ofAKind), 
  diceWithAtleast(ofAKind)
)

const maxKind = totalKinds(R.max)
const sumKinds = totalKinds(R.add)

export const scorePair = maxKind(2)
export const scoreTriple = maxKind(3)
export const scoreTwoPair = sumKinds(2)

const scoreStraight = straight => R.ifElse(R.equals(straight), R.sum, R.always(0))

export const scoreSmallStraight = scoreStraight(R.range(1,6))
export const scoreLargeStraight = scoreStraight(R.range(2,7))

const fullHouse = R.compose(R.equals([2,3]), R.values, diceCounts)
export const scoreFullHouse = R.ifElse(fullHouse, R.sum, R.always(0))

const same = R.compose(R.equals(1), R.length, R.uniq)
export const scoreYahtzee = R.ifElse(same, R.always(50), R.always(0))

export const scoreChance = R.sum


import R from 'ramda'

const scoreUpper = scoreVal => R.compose(R.sum, R.filter(R.equals(scoreVal)))

export const scoreOnes = scoreUpper(1)
export const scoreTwos = scoreUpper(2)

const diceCounts = R.countBy(R.identity)
const diceCountsWith = predicate => R.compose(R.map(parseInt), R.keys, R.filter(predicate), diceCounts)

const diceWithAtleast = count => diceCountsWith(c => c >= count)

 
const pairs = diceWithAtleast(2)
const triples = diceWithAtleast(3)

const totalKinds = (kind, multiplier) => R.compose(R.reduce(R.max, 0), R.map(n => n*multiplier), kind)

export const scorePair = totalKinds(pairs, 2)
export const scoreTriple = totalKinds(triples, 3)

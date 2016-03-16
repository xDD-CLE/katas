import murmurhash from 'node-murmurhash'
import R from 'ramda'

const hashWithMod = (mod) => (word) => (seed) => {
  return parseInt(murmurhash(word, seed)) % mod
}

export const maxHash = 100000000
export const hash = hashWithMod(maxHash)


const hashWordKTimes = (k) => (word) => {
  return R.times(hash(word), k)
}
export const defaultK = 3
export const hashWord = hashWordKTimes(defaultK)

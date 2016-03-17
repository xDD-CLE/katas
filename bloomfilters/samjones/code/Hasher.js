import murmurhash from 'node-murmurhash'
import R from 'ramda'

function* hashMaker(mod, word) {
  let seed = 0
  while(true) {
    seed = parseInt(murmurhash(word, seed)) % mod
    yield seed
  }
}

export const maxHash = 1000000
export const hash = R.curry(hashMaker)(maxHash)


const hashWordKTimes = (k) => (word) => {
  const hasher = hash(word)
  return R.times(_ => hasher.next().value, k)
}
export const defaultK = 5
export const hashWord = hashWordKTimes(defaultK)

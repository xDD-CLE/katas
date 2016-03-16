import R from 'ramda'
import murmurhash from 'node-murmurhash'

import * as FileReader from './FileReader'

export const isWordFromFile = (readWords, dictionaryPath = '/usr/share/dict/words') => (word) => {
  let dictionary = hashDictionary(readWords, dictionaryPath)
  return R.any(hash => dictionary[hash] === 1)(wordHashes(word))
}

export const  isWord = isWordFromFile(FileReader.readWords)


const hashDictionary = (readWords, dictionaryPath) => {
  let hashes = R.chain(wordHashes)(readWords(dictionaryPath))

  return hashes.reduce((acc, h) => {
    acc[h] =1
    return acc
  }, [])
}

const wordHashes = (word) => {
  return R.times(hash(word), 5)
}

const max = 10000000
const hashNum = 4
const hash = (word) => (seed) => {
  return murmurhash(word, seed)
}

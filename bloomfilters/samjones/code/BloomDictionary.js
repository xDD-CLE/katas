import R from 'ramda'
import * as Hasher from './Hasher'

import * as FileReader from './FileReader'

const inHashes = dictionaryHashes =>  R.all(h => dictionaryHashes[h] === 1)

const dictionaryPath = '/usr/share/dict/words'
export const isWordWithReaderAndHasher = (readWords, hashWord) => {
  const dictionaryWords = readWords(dictionaryPath)
  const dictionaryHashes = R.chain(hashWord, dictionaryWords)
  const dictionary = dictionaryHashes.reduce((acc, h) => {
    acc[h] = 1
    return acc
  }, [])
  return (word) => inHashes(dictionary)(hashWord(word))
}

export const isWord = 
  isWordWithReaderAndHasher(FileReader.readWords, Hasher.hashWord)




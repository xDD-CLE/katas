import R from 'ramda'

import * as FileReader from './FileReader'

export const isWordFromFile = (readWords, dictionaryPath = '/usr/share/dict/words') => (word) => {
  let words = readWords(dictionaryPath)
  return contains(words)(word)
}

export const  isWord = isWordFromFile(FileReader.readWords)

const contains = R.flip(R.contains)

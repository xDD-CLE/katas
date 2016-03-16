import R from 'ramda'

import * as FileReader from './FileReader'

const inList = R.flip(R.contains)

const dictionaryPath = '/usr/share/dict/words'
export const isWordWithReader = (readWords) => {
  let words = readWords(dictionaryPath)
  return inList(words)
}

export const  isWord = isWordWithReader(FileReader.readWords)


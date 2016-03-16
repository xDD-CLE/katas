import R from 'ramda'

import * as FileReader from './FileReader'

const dictionaryPath = '/usr/share/dict/words'
export const isWordWithReader = (readWords) => {
  const words = readWords(dictionaryPath)
  return R.contains(R.__, words)
}

export const  isWord = isWordWithReader(FileReader.readWords)


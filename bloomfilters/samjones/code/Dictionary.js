import fs from 'fs'
import R from 'ramda'

export const isWord = (dictionaryPath) => (word) => {
  return contains(dictionaryWords(dictionaryPath))(word)
}

const contains = R.flip(R.contains)

const dictionaryWords = (dictionaryPath) => {
  return fs.readFileSync(dictionaryPath).toString().split('\n')
}

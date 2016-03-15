import fs from 'fs'

export const readWordsWithFileReader = (readFile) => (filePath) => {
  return readFile(filePath).toString().split('\n')
}

export const readWords = readWordsWithFileReader(fs.readFileSync)

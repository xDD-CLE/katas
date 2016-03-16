import fs from 'fs'

export const readWordsWithFileReader = (readFile) => (filePath) => {
  return readFile(filePath, 'utf8').trim().split('\n')
}

export const readWords = readWordsWithFileReader(fs.readFileSync)

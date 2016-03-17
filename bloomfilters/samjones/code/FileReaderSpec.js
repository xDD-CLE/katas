import * as FileReader from './FileReader'
import R from 'ramda'

describe('Reading words', () => {
  const filePath = '/dev/null'
  const fileContents = 'hello\nworld\nfoo\nbar'
  const readFile = R.when(fp => fp === filePath, R.always(fileContents))

  const readWords = FileReader.readWordsWithFileReader(readFile)

  it('should split by line', () => {
    expect(readWords(filePath)).toEqual(['hello', 'world', 'foo', 'bar'])
  })
})

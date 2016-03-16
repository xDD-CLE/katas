import * as FileReader from './FileReader'

describe('Reading words', () => {
  const filePath = '/dev/null'
  const readFile = (fp) => {
    if (fp === filePath) {
      return 'hello\nworld\nfoo\nbar'
    }
  }
  const readWords = FileReader.readWordsWithFileReader(readFile)

  it('should split by line', () => {
    expect(readWords(filePath)).toEqual(['hello', 'world', 'foo', 'bar'])
  })
})

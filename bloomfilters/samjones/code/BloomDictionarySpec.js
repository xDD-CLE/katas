import * as Dictionary from './BloomDictionary.js'

describe('BloomDictionary', () => {
  const readWords = (_) => ['hello', 'world']
  const wordHashes = (w) => [w]
  const isWord = Dictionary.isWordWithReaderAndHasher(readWords, wordHashes)

  it('should contain a real word', () => {
    expect(isWord('hello')).toEqual(true)
  })

  it('should not contain a fake word', () => {
    expect(isWord('foobar')).toEqual(false)
  })

  it('should have isWord function', () => {
    expect(Dictionary.isWord).toBeDefined()
  })
})

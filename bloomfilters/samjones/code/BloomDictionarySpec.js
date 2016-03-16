import * as Dictionary from './BloomDictionary.js'

describe('BloomDictionary', () => {
  const readWords = (_) => ['hello', 'world']
  const isWord = Dictionary.isWordFromFile(readWords)

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

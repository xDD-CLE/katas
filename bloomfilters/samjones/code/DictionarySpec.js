import * as Dictionary from './Dictionary.js'

describe('Dictionary', () => {
  const readWords = (_) => ['hello', 'world']
  const isWord = Dictionary.isWordWithReader(readWords)

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

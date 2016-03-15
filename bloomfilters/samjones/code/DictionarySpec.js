import * as Dictionary from './Dictionary.js'

describe('Reading the System Dictionary', () => {
  const isWord = Dictionary.isWord('/usr/share/dict/words')

  it('Should contain a real word', () => {
    expect(isWord('hello')).toEqual(true)
  })

  it('Should not contain a fake word', () => {
    expect(isWord('foobar')).toEqual(false)
  })
})

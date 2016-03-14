import {loadDictionary} from './Dictionary.js'

describe('Reading the System Dictionary', () => {
  const contains = loadDictionary('/usr/share/dict/words')

  it('Should contain a real word', () => {
    expect(contains('hello')).toEqual(true)
  })

  it('Should not contain a fake word', () => {
    expect(contains('foobar')).toEqual(false)
  })
})

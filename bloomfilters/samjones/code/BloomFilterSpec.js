import {loadDictionary} from './Dictionary'
import {spellCheck} from './SpellCheck'

describe('bloom filter', () => {
  const dictPath = '/usr/share/dict/words'
  const dictionary = loadDictionary(dictPath)
  const spellChecker = spellCheck(dictionary)

  it('should spell check', () => {

    let misspellings = spellChecker('hello world foobar')

    expect(misspellings).toEqual(['foobar'])
  })
})

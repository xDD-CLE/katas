import * as BloomDictionary from './BloomDictionary'
import * as Dictionary from './Dictionary'
import * as SpellChecker from './SpellCheck'

describe('Spell Checking', () => {
  it('should find misspelling with bloom filter', () => {
    const findMisspellings = SpellChecker.findMisspellings(BloomDictionary.isWord)
    expect(findMisspellings('hello world foobar')).toEqual(['foobar'])
  })

  it('should find misspelling with naive solution', () => {
    const findMisspellings = SpellChecker.findMisspellings(Dictionary.isWord)
    expect(findMisspellings('hello world foobar')).toEqual(['foobar'])
  })
})

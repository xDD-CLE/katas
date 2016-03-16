import * as SpellChecker from './SpellCheck'

describe('Spell Checking', () => {
  const misspelling = 'foobar'
  const isWord = text => text !== misspelling

  const findMisspellings = SpellChecker.findMisspellings(isWord)

  it('should find misspellings', () => {
    expect(findMisspellings('hello world foobar')).toEqual([misspelling])
  })
})

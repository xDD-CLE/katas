import {spellCheck} from './SpellCheck'

describe('Spell Checking', () => {
  const misspelling = 'foobar'
  const dictionary = (text) => {
    return text !== misspelling
  }

  const spellChecker = spellCheck(dictionary)

  it('should find misspellings', () => {
    expect(spellChecker('hello world foobar')).toEqual([misspelling])
  })
})

import JasmineExpect from 'jasmine-expect'

import * as Hasher from './Hasher'

describe('Hashing', () => {
  const word = 'foobar'

  it('hashes a word', () => {
    const hashWithSeed = Hasher.hash(word)

    expect(hashWithSeed(5)).toBeDefined()
    expect(hashWithSeed(5)).toEqual(hashWithSeed(5))
    expect(hashWithSeed(42)).not.toEqual(hashWithSeed(5))
  })

  it('creates a list of hashes for a word', () => {
    let hashes = Hasher.hashWord(word)
    expect(hashes).toBeArrayOfSize(Hasher.defaultK)
    hashes.forEach(h => {
      expect(h).toBeDefined()
      expect(h).toBeLessThan(Hasher.maxHash)
    })
  })
})

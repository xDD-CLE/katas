import JasmineExpect from 'jasmine-expect'
import R from 'ramda'

import * as Hasher from './Hasher'

describe('Hashing', () => {
  const word = 'foobar'

  it('hashes a word', () => {
    const hasher = Hasher.hash(word)

    const hash1 = hasher.next().value
    const hash2 = hasher.next().value
    expect(hash1).toBeDefined()
    expect(hash1).not.toEqual(hash2)
  })

  it('creates a list of hashes for a word', () => {
    const hashes = Hasher.hashWord(word)
    expect(hashes).toBeArrayOfSize(Hasher.defaultK)
    expect(R.allUniq(hashes)).toEqual(true)
    hashes.forEach(h => {
      expect(h).toBeDefined()
      expect(h).toBeLessThan(Hasher.maxHash)
    })
  })
})

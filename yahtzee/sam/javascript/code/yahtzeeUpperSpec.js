import * as Yahtzee from './yahtzee'

describe('Yahtzee!', () => {
  describe('score upper', () => {
    it('should sum all ones', () => {
      expect(Yahtzee.scoreOnes([1,1,1,1,1])).toBe(5)
    })
    it('should sum some ones', () => {
      expect(Yahtzee.scoreOnes([1,1,1,2,3])).toBe(3)
    })
    it('should sum no ones', () => {
      expect(Yahtzee.scoreOnes([2,3,4,5,6])).toBe(0)
    })

    it('should sum all twos', () => {
      expect(Yahtzee.scoreTwos([2,2,2,2,2])).toBe(10)
    })
    it('should sum some twos', () => {
      expect(Yahtzee.scoreTwos([2,2,2,4,5])).toBe(6)
    })
    it('should sum no twos', () => {
      expect(Yahtzee.scoreTwos([1,3,4,5,6])).toBe(0)
    })
  })
})

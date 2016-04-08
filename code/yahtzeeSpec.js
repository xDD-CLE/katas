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

  describe('score pairs', () => {
    it('should score a pair', () => {
      expect(Yahtzee.scorePair([1,1,2,3,4])).toBe(2)
    })
    it('should score a pair with more than 2', () => {
      expect(Yahtzee.scorePair([1,1,1,3,4])).toBe(2)
    })
    it('should score highest pair', () => {
      expect(Yahtzee.scorePair([1,1,6,6,3])).toBe(12)
    })
    it('should score no pair', () => {
      expect(Yahtzee.scorePair([1,2,3,4,5])).toBe(0)
    })
  })

  describe('score triples', () => {
    it('should score a triple of ones', () => {
      expect(Yahtzee.scoreTriple([1,1,1,3,4])).toBe(3)
    })
    it('should score a triple of fours', () => {
      expect(Yahtzee.scoreTriple([4,4,4,6,6])).toBe(12)
    })
    it('should score a triple with more than 3', () => {
      expect(Yahtzee.scoreTriple([1,1,1,1,4])).toBe(3)
    })
    it('should score no triple', () => {
      expect(Yahtzee.scoreTriple([1,2,3,4,5])).toBe(0)
    })
  })
})

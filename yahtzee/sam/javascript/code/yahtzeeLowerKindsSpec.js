import * as Yahtzee from './yahtzee'

describe('Yahtzee!', () => {
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

  describe('score two pairs', () => {
    it('should score a pair of ones and twos', () => {
      expect(Yahtzee.scoreTwoPair([1,1,2,2,4])).toBe(6)
    })
    it('should score a pair with more than 2 with another pair', () => {
      expect(Yahtzee.scoreTwoPair([1,1,1,3,3])).toBe(8)
    })
    it('should score no pair', () => {
      expect(Yahtzee.scoreTwoPair([1,2,3,4,5])).toBe(0)
    })
  })

  describe('small straight', () => {
    it('should score a small straight', () => {
      expect(Yahtzee.scoreSmallStraight([1,2,3,4,5])).toBe(15)
    })
    it('should score no small straight', () => {
      expect(Yahtzee.scoreSmallStraight([6,2,3,4,5])).toBe(0)
    })
  })

  describe('large straight', () => {
    it('should score a large straight', () => {
      expect(Yahtzee.scoreLargeStraight([2,3,4,5,6])).toBe(20)
    })
    it('should score no large straight', () => {
      expect(Yahtzee.scoreLargeStraight([6,2,3,4,5])).toBe(0)
    })
  })

  describe('full house', () => {
    it('should score a full house', () => {
      expect(Yahtzee.scoreFullHouse([1,1,2,2,2])).toBe(8)
    })
    it('should score no full house', () => {
      expect(Yahtzee.scoreFullHouse([1,1,1,2,1])).toBe(0)
    })
  })

  describe('Yahtzee!', () => {
    it('should score a Yahtzee!', () => {
      expect(Yahtzee.scoreYahtzee([1,1,1,1,1])).toBe(50)
    })
    it('should score no Yahtzee!', () => {
      expect(Yahtzee.scoreYahtzee([1,1,2,2,3])).toBe(0)
    })
  })

  describe('Chance', () => {
    it('should sum all dice', () => {
      expect(Yahtzee.scoreChance([1,2,3,5,6])).toBe(17)
    })
  })

})

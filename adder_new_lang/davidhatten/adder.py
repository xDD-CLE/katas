__author__ = 'david'
import re

class Adder:

    def __init__(self):
        self.rawInput = ''

    def add(self, addInput):
        if addInput:
            self.rawInput = addInput
            splitInput = [int(x) for x in re.split(self.delimiters(), self.rawInput)]

            return self.sumInputs(splitInput)
        else:
            return 0

    def sumInputs(self, inputs):
        badInput = []

        result = [x if x >= 0 else badInput.append(x) for x in inputs]
        self.verifyNoNegativeInputs(badInput)

        return sum(result)

    def delimiters(self):
        delims = [',', '\n']

        if self.rawInput.startswith('//'):
            self.rawInput = self.rawInput.strip('//')

            while (not self.rawInput.startswith('\n')):
                delims.append(self.rawInput[0])
                self.consumeCharacter()
            else:
                self.consumeCharacter()


        return '|'.join(delims)

    def consumeCharacter(self):
        self.rawInput = self.rawInput[1:]

    def verifyNoNegativeInputs(self, inputs):
        if (inputs):
            raise RuntimeError('Negative input not allowed: ' + ', '.join(str(x) for x in inputs))
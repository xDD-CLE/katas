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
        result = 0
        for input in inputs:
            result += input

        return result

    def delimiters(self):
        delims = [',', '\n']
        return '|'.join(delims)
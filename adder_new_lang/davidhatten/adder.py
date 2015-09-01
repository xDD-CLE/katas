__author__ = 'david'

rawInput = ''

def add(addInput):
    if addInput:
        result = 0
        rawInput = addInput
        splitInput = rawInput.split(',')

        for input in splitInput:
            result += int(input)

        return result
    else:
        return 0

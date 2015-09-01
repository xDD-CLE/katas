__author__ = 'david'

rawInput = ''

def add(addInput):
    if addInput:
        result = 0
        rawInput = addInput
        splitInput = [int(x) for x in rawInput.split(',')]

        return sumInputs(splitInput)
    else:
        return 0

def sumInputs(inputs):
    result = 0
    for input in inputs:
        result += input

    return result
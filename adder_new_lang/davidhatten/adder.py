__author__ = 'david'
import re

rawInput = ''

def add(addInput):
    if addInput:
        rawInput = addInput
        splitInput = [int(x) for x in re.split(delimiters(), rawInput)]

        return sumInputs(splitInput)
    else:
        return 0

def sumInputs(inputs):
    result = 0
    for input in inputs:
        result += input

    return result

def delimiters():
    delims = [',', '\n']
    return '|'.join(delims)
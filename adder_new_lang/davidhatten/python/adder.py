__author__ = 'david'
import re

adder_globals = {'rawInput' : '', 'badInput' : []}

def add(addInput):
    if addInput:
        adder_globals['rawInput'] = addInput
        splitInput = [int(x) for x in re.split(delimiters(), adder_globals['rawInput'])]

        return sumInputs(splitInput)
    else:
        return 0

def sumInputs(inputs):
    adder_globals['badInput'].clear()
    result = [x if x >= 0 else adder_globals['badInput'].append(x) for x in inputs]
    verifyNoNegativeInputs()

    return sum(result)

def delimiters():
    delims = [',', '\n']

    if adder_globals['rawInput'].startswith('//'):
        adder_globals['rawInput'] = adder_globals['rawInput'].strip('//')

        while (not adder_globals['rawInput'].startswith('\n')):
            delims.append(adder_globals['rawInput'][0])
            consumeCharacter()
        else:
            consumeCharacter()


    return '|'.join(delims)

def consumeCharacter():
    adder_globals['rawInput'] = adder_globals['rawInput'][1:]

def verifyNoNegativeInputs():
    if (adder_globals['badInput']):
        raise RuntimeError('Negative input not allowed: ' + ', '.join(str(x) for x in adder_globals['badInput']))
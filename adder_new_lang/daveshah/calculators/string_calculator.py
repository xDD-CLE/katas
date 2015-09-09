__author__ = 'shah'


class Calculator(object):

    def __init__(self, input_string):
        self.input = input_string

    def add(self):
        if self.input == "":
            return ""
        else:
            return reduce(lambda x, y: x + y, map(lambda x: int(x), self.input.split(",")))

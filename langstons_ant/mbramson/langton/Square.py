

class Square:
    def __init__(self, x, y):
        self.activated = False
        self.x = x
        self.y = y

    def flip(self):
        self.activated = not self.activated

    def __hash__(self):
        return hash((self.x, self.y))

    def __eq__(self, other):
        return (self.x, self.y) == (other.x, other.y)

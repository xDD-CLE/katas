

class Square:
    def __init__(self, x, y):
        self.activated = 0
        self.x = x
        self.y = y

    def flip(self):
        if self.activated == 0:
            self.activated = 1
        else:
            self.activated = 0

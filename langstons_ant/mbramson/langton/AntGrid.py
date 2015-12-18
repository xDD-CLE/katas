from langton.Square import Square

class AntGrid:
    def __init__(self):
        self.x = 0
        self.y = 0
        self.dir = "up"
        self.grid_list = [Square(x=0, y=0)]

    def turn_right(self):
        right_map = {"up": "right",
                     "right": "down",
                     "down": "left",
                     "left": "up"}
        self.dir = right_map[self.dir]

from langton.Square import Square

class AntGrid:
    def __init__(self):
        self.x = 0
        self.y = 0
        self.dir = "up"
        self.grid_list = [Square(x=0, y=0)]

    def turn(self, activated):
        right_map = {"up": "right",
                     "right": "down",
                     "down": "left",
                     "left": "up"}
        left_map = {"up": "left",
                    "right": "down",
                    "down": "left",
                    "left": "down"}
        if activated:
            self.dir = left_map[self.dir]
        else:
            self.dir = right_map[self.dir]

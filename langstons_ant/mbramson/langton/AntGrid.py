from langton.Square import Square


class AntGrid:
    def __init__(self):
        self.x = 0
        self.y = 0
        self.dir = "up"
        self.grid_list = [Square(x=0, y=0)]

    def current_activation(self):
        for square in self.grid_list:
            if square == Square(x=self.x, y=self.y):
                return square.activated

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

    def translate(self, dir):
        if dir == "up":
            self.y += 1
        elif dir == "down":
            self.y -= 1
        elif dir == "right":
            self.x += 1
        elif dir == "left":
            self.x -= 1

    def step(self):
        self.turn(self.current_activation())
        self.translate(self.dir)

import unittest

from langton.AntGrid import AntGrid
from langton.Square import Square


class TestAnt(unittest.TestCase):

    def test_ant_grid_starts_at_0_x_coordinate(self):
        ant = AntGrid()
        self.assertEqual(0, ant.x)

    def test_ant_grid_starts_at_0_y_coordinate(self):
        ant = AntGrid()
        self.assertEqual(0, ant.y)

    def test_ant_grid_starts_with_up_direction(self):
        ant = AntGrid()
        self.assertEqual("up", ant.dir)

    def test_ant_grid_has_grid_set(self):
        ant = AntGrid()
        self.assertIsInstance(ant.grid_list, list)

    def test_ant_grid_contains_0_0_square(self):
        ant = AntGrid()
        self.assertIn(Square(x=0, y=0), ant.grid_list)

    # turning tests
    def test_ant_grid_turn_dir_up_to_right_when_unactivated(self):
        ant = AntGrid()
        ant.dir = "up"
        ant.turn(activated=False)
        self.assertEqual("right", ant.dir)

    def test_ant_grid_turn_dir_right_to_down_when_unactivated(self):
        ant = AntGrid()
        ant.dir = "right"
        ant.turn(activated=False)
        self.assertEqual("down", ant.dir)

    def test_ant_grid_turn_dir_down_to_left_when_unactivated(self):
        ant = AntGrid()
        ant.dir = "down"
        ant.turn(activated=False)
        self.assertEqual("left", ant.dir)

    def test_ant_grid_turn_dir_right_to_left_when_unactivated(self):
        ant = AntGrid()
        ant.dir = "left"
        ant.turn(activated=False)
        self.assertEqual("up", ant.dir)

    def test_ant_grid_turn_dir_up_to_right_when_activated(self):
        ant = AntGrid()
        ant.dir = "up"
        ant.turn(activated=True)
        self.assertEqual("left", ant.dir)

    def test_ant_grid_turn_dir_right_to_down_when_activated(self):
        ant = AntGrid()
        ant.dir = "right"
        ant.turn(activated=True)
        self.assertEqual("down", ant.dir)

    def test_ant_grid_turn_dir_down_to_left_when_activated(self):
        ant = AntGrid()
        ant.dir = "down"
        ant.turn(activated=True)
        self.assertEqual("left", ant.dir)

    def test_ant_grid_turn_dir_right_to_left_when_activated(self):
        ant = AntGrid()
        ant.dir = "left"
        ant.turn(activated=True)
        self.assertEqual("down", ant.dir)

    def test_ant_get_current_activation_returns_false_at_origin(self):
        ant = AntGrid()
        ant.x, ant.y = 0, 0
        ant.grid_list = [Square(x=0, y=0)]
        self.assertEqual(False, ant.current_activation())

    def test_ant_get_current_activation_returns_true_if_square_activated(self):
        ant = AntGrid()
        ant.x, ant.y = 1, 3
        square_1_3 = Square(x=1, y=3)
        square_1_3.activated = True
        ant.grid_list = [square_1_3]
        self.assertEqual(True, ant.current_activation())

    def test_ant_get_current_activation_returns_state_of_correct_square(self):
        ant = AntGrid()
        ant.x, ant.y = 3, 4
        square_0_0 = Square(x=0, y=0)
        square_0_1 = Square(x=0, y=1)
        square_3_4 = Square(x=3, y=4)
        square_3_4.activated = True
        ant.grid_list = [square_0_0, square_0_1, square_3_4]
        self.assertEqual(True, ant.current_activation())

    #def test_first_step_from_unactivated_origin_with_dir_up_is_right(self):
        #ant = AntGrid()
        #ant.x, ant.y = 0, 0

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

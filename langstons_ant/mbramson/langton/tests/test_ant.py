import unittest

from langton.AntGrid import AntGrid


class TestAnt(unittest.TestCase):

    def test_ant_starts_at_0_x_coordinate(self):
        ant = AntGrid()
        self.assertEqual(0, ant.x)

    def test_ant_starts_at_0_y_coordinate(self):
        ant = AntGrid()
        self.assertEqual(0, ant.y)

    def test_ant_starts_with_up_direction(self):
        ant = AntGrid()
        self.assertEqual("up", ant.dir)


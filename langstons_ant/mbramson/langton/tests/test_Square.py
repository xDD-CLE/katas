from langton.Square import Square
import unittest


class TestSquare(unittest.TestCase):

    def test_square_starts_unactivated(self):
        square = Square(x=0, y=4)
        self.assertEqual(0, square.activated)

    def test_square_starts_with_correct_x_value(self):
        square = Square(x=5, y=23)
        self.assertEqual(5, square.x)

    def test_square_starts_with_correct_y_value(self):
        square = Square(x=2, y=-4)
        self.assertEqual(-4, square.y)

    def test_square_flip_function_flips_activated_property(self):
        square = Square(x=0, y=0)
        square.flip()
        self.assertEqual(1, square.activated)

    def test_square_flipping_twice_leaves_same_activated_property(self):
        square = Square(x=0, y=0)
        square.flip()
        square.flip()
        self.assertEqual(0, square.activated)
        
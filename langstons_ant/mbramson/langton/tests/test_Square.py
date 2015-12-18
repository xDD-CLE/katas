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

    def test_square_hash_reflect_x_and_y_variation1(self):
        square = Square(x=3, y=20)
        self.assertEqual(hash((3, 20)), hash(square))

    def test_square_hash_reflect_x_and_y_variation2(self):
        square = Square(x=-10, y=2)
        self.assertEqual(hash((-10, 2)), hash(square))

    def test_square_hash_does_not_reflect_activation(self):
        square_a = Square(x=2, y=3)
        square_b = Square(x=2, y=3)
        square_b.flip()
        self.assertEqual(hash(square_a), hash(square_b))

    def test_different_squares_have_different_hashes(self):
        square_a = Square(x=1, y=3)
        square_b = Square(x=2, y=7)
        self.assertNotEqual(hash(square_a), hash(square_b))

    def test_square_equal_to_other_square_object_with_same_coords(self):
        square_a = Square(x=5, y=2)
        square_b = Square(x=5, y=2)
        self.assertTrue(square_a == square_b,
                        "Squares with equal coordinates should be equal")

    def test_squares_unequal_if_different_coordinates(self):
        square_a = Square(x=5, y=2)
        square_b = Square(x=5, y=7)
        self.assertFalse(square_a == square_b,
                         "Square with uneqal coordinates should not be equal")

    def test_squares_should_be_equal_with_same_coords_different_state(self):
        square_a = Square(x=5, y=2)
        square_b = Square(x=5, y=2)
        square_b.flip()
        self.assertTrue(square_a == square_b,
                        "Squares with equal coordinates should be equal even "
                        "with different activated states")

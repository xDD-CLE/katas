from parsers.string_parser import Parser

__author__ = 'shah'


def test_that_it_converts_newline_characters_to_commas():
    assert Parser().parse("1\n2,3") == "1,2,3"


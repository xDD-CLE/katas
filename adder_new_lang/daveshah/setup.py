try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

config = {
    'description': 'A String Calculator Kata',
    'author': 'Dave Shah',
    'author_email': 'david.a.shah@gmail.com',
    'version': '0.1',
    'install_requires': ['nose'],
    'packages': ['calculators'],
    'scripts': [],
    'name': 'string_calculator'
}

setup(**config)

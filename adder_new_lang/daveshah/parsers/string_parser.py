__author__ = 'shah'


class Parser(object):

    def parse(self, param):
        if param.startswith("//"):
            return ""
        return param.replace("\n", ",")

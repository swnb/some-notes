# python


class Human:
    def __init__(self):
        self.name = ''
        self.age = 0

    def getName(self):
        return self.name

    def setAge(self, age):
        self.age = age


a = 1


def seta(newnum):
    if globals().a == newnum:
        pass
    else:
        a = newnum

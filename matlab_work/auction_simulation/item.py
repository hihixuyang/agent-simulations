class Item(Object):

    def __init__(self, val):
        self.val = val
        self.price = val
        self.history = []

    def profit(self):
        return self.price - self.val

    def bid(self, newprice, name):
        if newprice <= self.price:
            return False
        self.price = newprice
        self.history.append(name)

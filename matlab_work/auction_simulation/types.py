import numpy as np
import math

class Type(object):
    
    def __init__(self, wallet, itemsneeded):
        self.wallet = wallet
        self.owned = []
        self.itemsneeded = itemsneeded
        self.maxbid = self.wallet - self.itemsneeded;

    def clear(self):
        self.wallet = 0
        self.owned = []

    def buy(self, price, item):
	if self.wallet < price:
		return 'FAIL'
	self.wallet -= price;
	self.owned.append((item, price))
        self.maxbid = self.wallet - self.itemsneeded + len(self.owned)

    def bid(self, item, currentprice):
        return False


class Bhavin(Type):
    
    def bid(self, item):
        if Type.wallet < price:
            return False
        return Type.maxbid

class A(Type):
    
    def bid(self, item):
        params = np.array([self.wallet, self.itemsneeded, self.maxbid, item.price/item.val])
        function = np.array([0, 0, 0, 0])
        val = np.dot(params, function)
        if val < .5:
            return False
        else:
            return min(Math.ceil(item.price*val/.4999), self.maxbid)

class B(Type):
    
    def bid(self, item):
        params = np.array([self.wallet, self.itemsneeded, self.maxbid, item.price/item.val])
        function = np.array([0, 0, 0, 0])
        val = np.dot(params, function)
        if val < .5:
            return False
        else:
            return min(Math.ceil(item.price*val/.4999), self.maxbid)

class C(Type):
    
    def bid(self, item):
        params = np.array([self.wallet, self.itemsneeded, self.maxbid, item.price/item.val])
        function = np.array([0, 0, 0, 0])
        val = np.dot(params, function)
        if val < .5:
            return False
        else:
            return min(Math.ceil(item.price*val/.4999), self.maxbid)

class D(Type): 
    
    def bid(self, item):
        params = np.array([self.wallet, self.itemsneeded, self.maxbid, item.price/item.val])
        function = np.array([0, 0, 0, 0])
        val = np.dot(params, function)
        if val < .5:
            return False
        else:
            return min(Math.ceil(item.price*val/.4999), self.maxbid)

class E(Type): 
    
    def bid(self, item):
        params = np.array([self.wallet, self.itemsneeded, self.maxbid, item.price/item.val])
        function = np.array([0, 0, 0, 0])
        val = np.dot(params, function)
        if val < .5:
            return False
        else:
            return min(Math.ceil(item.price*val/.4999), self.maxbid)

class F(Type): 
    
    def bid(self, item):
        params = np.array([self.wallet, self.itemsneeded, self.maxbid, item.price/item.val])
        function = np.array([0, 0, 0, 0])
        val = np.dot(params, function)
        if val < .5:
            return False
        else:
            return min(Math.ceil(item.price*val/.4999), self.maxbid)

class G(Type): 
    
    def bid(self, item):
        params = np.array([self.wallet, self.itemsneeded, self.maxbid, item.price/item.val])
        function = np.array([0, 0, 0, 0])
        val = np.dot(params, function)
        if val < .5:
            return False
        else:
            return min(Math.ceil(item.price*val/.4999), self.maxbid)

class H(Type): 
    
    def bid(self, item):
        params = np.array([self.wallet, self.itemsneeded, self.maxbid, item.price/item.val])
        function = np.array([0, 0, 0, 0])
        val = np.dot(params, function)
        if val < .5:
            return False
        else:
            return min(Math.ceil(item.price*val/.4999), self.maxbid)

class I(Type): 
    
    def bid(self, item):
        params = np.array([self.wallet, self.itemsneeded, self.maxbid, item.price/item.val])
        function = np.array([0, 0, 0, 0])
        val = np.dot(params, function)
        if val < .5:
            return False
        else:
            return min(Math.ceil(item.price*val/.4999), self.maxbid)





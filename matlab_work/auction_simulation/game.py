""" Auction simulation
The main file for a simulation between an HBA agent and 
several bidders representing various 'types'. The HBA agent
as auctioneer must maximize profit while predicting the types
of the bidders.
"""

import types
import hba
import item
from random import shuffle, randint
from collections import deque

def play(buyersize, itemsize):
    alltypes = (BHAVIN, A, B, C, D, E, F, G, H, I)
    buyers = []
    for _ in range(buyersize/10):
        for i in range(10):
            buyers.append(alltypes[i]())
    shuffle(buyers)
    items = createItems(itemsize)


def createItems(itemsize):
    items = deque()
    for _ in range(itemsize):
        items.append(item(randint(1, 100)))
    return items

def sellItem(item, buyers, index):
    declines = 0
    highestBidder = None
    while declines < len(buyers):
        bidval = buyers[index].bid(item)
        if bidval == False:
            declines += 1
        else:
            success = item.bid(bidval, index)
            if not success:
                declines += 1
            else:
                declines = 0
                highestBidder = buyer[index]
    

    


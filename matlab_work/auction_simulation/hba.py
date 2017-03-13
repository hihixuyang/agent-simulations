import types
import numpy

class HBA(Object):

    def __init__(self, num_buyers, num_types):

        # initialize the 2-d array of buyers & their type distribution probabilities
        self.behaviors = numpy.zeros((num_buyers, num_types))
        initial_probability = 1 / num_types
        for i in range(num_buyers):
            for j in range(num_types):
                self.behaviors[i, j] = initial_probability;

    def pick_item(self, possible_items):
        pass

    def update_probability(self, bid_history):
        pass

class smartHBA(HBA):

    def pick_item(self, possible_items):
        pass # TODO implement with MCTS

    def update_probability(self, bid_history):
        # note: this would be OP. No HBA can see exact price of bids, therefore.
        pass # TODO implement

class dumbassHBA(HBA):

    def pick_item(self, possible_items):
        pass # TODO implement with MCTS

    def update_probability(self, bid_history):
        pass # TODO implement


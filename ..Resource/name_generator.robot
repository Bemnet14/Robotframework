import random

class RandomNameGenerator:
    def generate_random_Voor_name(self):
        Voor_name = ["John", "Alice", "Bob", "Emma", "Michael"]
        return random.choice(Voor_name)

    def generate_random_Achter_name(self):
        Achter_name = ["Smith", "Johnson", "Brown", "Lee", "Davis"]
        return random.choice(Achter_name)

class ArrayStore:
    def __init__(self):
        self.numbers = []

    def accept_numbers(self, nums):
        if len(nums) != 10:
            raise ValueError("Exactly 10 integers are required.")
        self.numbers = nums.copy()

    def display_with_while(self):
        print("Using while loop:")
        i = 0
        while i < len(self.numbers):
            print(self.numbers[i], end=' ')
            i += 1
        print()

    def display_with_for(self):
        print("Using for loop:")
        for num in self.numbers:
            print(num, end=' ')
        print()

    def sort_ascending(self):
        self.numbers.sort()

    def count_occurrences(self, value):
        return self.numbers.count(value)

    def insert_at_position(self, value, position):
        if position < 0 or position > len(self.numbers):
            raise IndexError("Position out of range.")
        self.numbers.insert(position, value)

    def get_unique_elements(self):
        unique = []
        for num in self.numbers:
            if num not in unique:
                unique.append(num)
        return unique


store = ArrayStore()
store.accept_numbers([9, 2, 2, 9, 10, 9, 3, 4, 5, 6])
store.display_with_while()
store.display_with_for()
store.sort_ascending()
print("Sorted list:", store.numbers)
print("Occurrences of 9:", store.count_occurrences(9))
store.insert_at_position(7, 5)
print("After insertion:", store.numbers)
print("Unique elements:", store.get_unique_elements())
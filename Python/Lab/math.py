def table_for_loop(n):
    print("Multiplication Table using for loop:")
    for i in range(1, 11):
        print(f"{n} x {i} = {n * i}")

def table_while_loop(n):
    print("\nMultiplication Table using while loop:")
    i = 1
    while i <= 10:
        print(f"{n} x {i} = {n * i}")
        i += 1

def table_do_while_loop(n):
    print("\nMultiplication Table using simulated do-while loop:")
    i = 1
    while True:
        print(f"{n} x {i} = {n * i}")
        i += 1
        if i > 10:
            break

table_for_loop(2)
table_while_loop(2)
table_do_while_loop(2)

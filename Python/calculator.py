def simple_calculator(a,b):
    print(f"{a} + {b} = {a+b}")
    print(f"{a} - {b} = {a-b}")
    print(f"{a} * {b} = {a*b}")
    if(b!=0):
        print(f"{a} / {b} = {a/b}")
    else:
        print("Division by zero is not alloed")
        
try:
    a=float(input("Enter the first number:"))
    b= float(input("Enter the secpong number: "))
except Exception:
    print("Invalid input. Please enter numeric values.")
    exit(0)
simple_calculator(a,b)


    
def add(*args):
    if any(type(arg) == str for arg in args):
        return ' '.join(map(str, args))
    return sum(args)

print(add(10, 20))         
print(add(10, 20, 30))     
print(add(10.5, 20.1))     
print(add("Hello", 20))    



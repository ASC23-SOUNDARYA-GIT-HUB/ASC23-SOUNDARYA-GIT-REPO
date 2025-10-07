s="hello world!"
print("Original String: ",s)
print("UpperCase: ",s.upper() )
print("Replace world with Python:",s.replace("World","Python"))
print("Split by comma: ",s.split(","))

a=10
b=3
print("\nNumbers: a=",a,",b=",b)
print("Addition:",a+b)
print("Division:",a/b)
print("Integer Division:",a//b)
print("Power:",a**b)

list=[1,2,3,4,5]
print("\nOriginal list: ",list)
list.append(6)
print("After Append:",list)
list.remove(3)
print("After removing 3:",list)
print("List sliced[1:4]:",list[1:4])
print("Sum of list:",sum(list))

print("\n----Deep Dive: List------")
squared =[x**2 for x in list]
print("List comprehension (squared):",squared)

#String
unsorted =[3,1,4,2,5]
print("Unsorted List:",unsorted)

#--tuple--
tuple=(1,2,3,4,5)
print("\nOriginal tuple: ",tuple)


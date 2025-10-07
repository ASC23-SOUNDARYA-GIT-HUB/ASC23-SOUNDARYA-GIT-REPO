import sys
print("Script Name: ",sys.argv[0])
print("Sixth Arguments: ",sys.argv[6])

for arg in sys.argv[1:]:
    print("Arguments: ",arg)

if len(sys.argv)>1:
    print("Arguments passed:",sys.argv[1:])
else:
    print("No arguments passsed.")
def validate(user_input):

    key = ''.join([
        chr(82),
        chr(69),
        chr(83),
        chr(69),
        chr(65),
        chr(82),
        chr(67),
        chr(72),
        chr(50),
        chr(48),
        chr(50),
        chr(54)
    ])

    return user_input == key


print("=" * 40)
print("MedCore Research Agent Utility")
print("=" * 40)

token = input("Enter Authorization Key: ")

if validate(token):

    encoded_flag = [
        80,85,76,83,69,123,
        65,71,69,78,84,95,
        65,78,65,76,89,83,73,83,
        95,67,79,77,80,76,69,84,69,
        125
    ]

    flag = ""

    for c in encoded_flag:
        flag += chr(c)

    print("\nAccess Granted")
    print(flag)

else:

    print("\nAccess Denied")
def blink(arr):
    i = 0
    while i < len(arr):
        if int(arr[i]) == 0:
            arr[i] = "1"
        elif len(arr[i]) % 2 == 0:
            s = arr[i]
            first_half = int(s[:len(s) // 2])
            second_half = int(s[len(s) // 2:])
            # print(first_half, second_half)
            arr[i] = str(first_half)
            arr.insert(i + 1, str(second_half))
            i += 1
        else:
            arr[i] = str(int(arr[i]) * 2024)
        i += 1
    return arr

# array = ["125", "17"]
array = ["3028", "78", "973951", "5146801", "5", "0", "23533", "857"]

for _ in range(75):
    print(f"iteration #{_}, length of array: {len(array)}")
    # TODO: Use Unique on the array, store the difference in a temp val variable
    # tempVal += len(array)
    # array = array.unique()
    # tempVal -= len(array)
    array = blink(array)


print(array)
print(len(array))

def blink(arr):
    i = 0
    while i < len(arr):
        if int(arr[i]) == 0:
            arr[i] = "1"
        elif len(arr[i]) % 2 == 0:
            s = arr[i]
            first_half = int(s[:len(s) // 2])
            second_half = int(s[len(s) // 2:])
            print(first_half, second_half)
            arr[i] = str(first_half)
            arr.insert(i + 1, str(second_half))
            i += 1
        else:
            arr[i] = str(int(arr[i]) * 2024)
        i += 1
    return arr

array = ["125", "17"]

for _ in range(25):
    print(array)
    array = blink(array)


print(array)
print(len(array))

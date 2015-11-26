# Pseudo Code Practice
1) a method that returns the sum of two integers

```
START

GET number1
GET number2

result = number + number2

PRINT result

END
```

2) a method that takes an array of strings, and returns a string that is all those strings concatenated together
```
START

// Given an array of strings

SET iterator = 1
SET string = ""

WHILE iterator < length of array
  result = result + string
  iterator = iterator + 1
PRINT string

END
```

3) a method that takes an array of integers, and returns a new array with every other element
```
START

# Given an array of integers

SET iterator = 1
SET new_array = []

WHILE iterator < length of array
  IF iterator is odd
    new_array << array[i]

PRINT new_array

END
```

# Assignment-03

1. 8x3 Encoder using functions and tasks
2. 16x1 MUX using functions and tasks
3. 3x8 Decoder using functions and tasks
4. 1x16 DeMUX using functions and tasks
5. 8-bit, 16-bit array multiplier
6. 8-bit, 32-bit Booth's Multiplier using combinational approach

## 4. 8-bit, 16-bit array multiplier

```
>>> Testing 8 bit array multiplier
M1 =   0   Q1 =   0   R1 =     0   expected =     0
M1 = 255   Q1 = 255   R1 = 65025   expected = 65025
M1 = 255   Q1 =   1   R1 =   255   expected =   255
M1 =   1   Q1 = 255   R1 =   255   expected =   255
M1 =  15   Q1 =  15   R1 =   225   expected =   225
M1 = 240   Q1 = 240   R1 = 57600   expected = 57600
>>> 8-bit random tests passed.

>>> Testing 32 bit array multiplier
M1 =          0   Q1 =          0   R1 =                    0   expected =                    0
M1 = 4294967295   Q1 = 4294967295   R1 = 18446744065119617025   expected = 18446744065119617025
M1 = 4294967295   Q1 =          1   R1 =           4294967295   expected =           4294967295
M1 =          1   Q1 = 4294967295   R1 =           4294967295   expected =           4294967295
M1 =      65535   Q1 =      65535   R1 =           4294836225   expected =           4294836225
M1 = 4294901760   Q1 = 4294901760   R1 = 18446181128051097600   expected = 18446181128051097600
>>> 32-bit random tests passed.
```

## 5. 8-bit, 32-bit Booth's Multiplier using combinational approach

```
>>> Testing 8 bit booth multiplier
M1 =   51   Q1 =   49   R1 =   2499   expected =   2499
M1 =  -51   Q1 =   49   R1 =  -2499   expected =  -2499
M1 =  127   Q1 =  127   R1 =  16129   expected =  16129
M1 = -127   Q1 =  127   R1 = -16129   expected = -16129
M1 = -128   Q1 = -128   R1 =  16384   expected =  16384
>>> done!

>>> Testing 32 bit booth multiplier
M2 =         255   Q2 =         255   R2 =                 65025   expected =                 65025
M2 =        -255   Q2 =         241   R2 =                -61455   expected =                -61455
M2 =  2147483647   Q2 =  2147483647   R2 =   4611686014132420609   expected =   4611686014132420609
M2 = -2147483647   Q2 =  2147483647   R2 =  -4611686014132420609   expected =  -4611686014132420609
M2 = -2147483648   Q2 = -2147483648   R2 =   4611686018427387904   expected =   4611686018427387904
M2 = -2147483648   Q2 =  2147483647   R2 =  -4611686016279904256   expected =  -4611686016279904256
>>> done!
```
def commonDivisor(n):
    nums = list(range(2, n+1))
    sum = 0
    for idx, num in enumerate(nums):
        if num % 2 == 0 and num % 3 != 0  and num % 5 != 0:
            sum += 50
            print(idx,num,sum)

        elif num % 2 != 0 and num % 3 == 0  and num % 5 != 0:
            sum += 33
            print(idx,num,sum)

        elif num % 2 != 0 and num % 3 != 0  and num % 5 == 0:
            sum += 20
            print(idx,num,sum)

        elif num % 2 == 0 and num % 3 == 0  and num % 5 != 0:
            sum += (50 + 33 - (100//(2*3)))
            print(idx,num,sum)

        elif num % 2 == 0 and num % 3 != 0  and num % 5 == 0:
            sum += (50 + 20 - (100//(2*5)))
            print(idx,num,sum)

        elif num % 2 != 0 and num % 3 == 0  and num % 5 == 0:
            sum += (33 + 20 - (100//(3*5)))
            print(idx,num,sum)

        elif num % 2 == 0 and num % 3 == 0  and num % 5 == 0:
            sum += (50 + 33 + 20 - (100//(2*3*5)))
            print(idx,num,sum)

        else:
            sum += (100//num)
            print(idx,num,sum)

    return sum

print(commonDivisor(100)) # it gives me wrong answer.

############################################################################
# better version

def commonDivisor3(n):
    from math import gcd
    alist = [1 for a in range(2, n+1) for b in range(2, n+1)
            if gcd(a, b) > 1]
    count = sum(alist)
    #print(sum(alist))
    print(alist)
    print(count)

n = int(input("How many?:"))
commonDivisor3(n)

############################################################################

# best version
primeslist = [
      2,     3,     5,     7,    11,    13,    17,    19,    23,    29,
     31,    37,    41,    43,    47,    53,    59,    61,    67,    71,
     73,    79,    83,    89,    97,   101,   103,   107,   109,   113,
]

def prime_combinations(n):
    """Generate combinations of distinct primes where their product is
    less than n. Each yielded item is a 3-tuple containing:
    - the combination in increasing order,
    - the product of the primes in the combination,
    - k where the last and largest prime in the combination is the k'th
      prime (where 2 is the 1st prime.)
    Items are yielded in lexicographical order. The first item yielded
    is the empty combination ((), 1, 0).
    """
    def primecombos(prefix, prod, ndx):
        yield prefix, prod, ndx
        while True:
            newprime = primeslist[ndx]
            newprod = prod * newprime
            if newprod >= n:
                return
            yield from primecombos(prefix + (newprime,), newprod, ndx+1)
            ndx += 1

    if 1 < n <= primeslist[-1] and n == int(n):
        yield from primecombos((), 1, 0)

def commonDivisor2(n):
    """Count the number of pairs of positive integers less than or
    equal to n that have a common factor greater than 1.
    """
    pcombs = prime_combinations(n+1)
    next(pcombs)  # throw away the empty combination of primes
    return sum((1 if len(c[0]) % 2 else -1) * (n // c[1]) ** 2
               for c in  pcombs)  # c[0] is combination, c[1] its product

print(commonDivisor2(100))

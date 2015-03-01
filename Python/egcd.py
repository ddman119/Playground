def egcd(a, b):
    x, y, u, v = 0, 1, 1, 0

    while a:
        q, r = b // a, b % a
        m, n = x - u * q, y - v * q
        b, a, x, y, u, v = a, r, u, v, m, n

    return b, x, y

if __name__ == "__main__":
    print(egcd(12, 18))

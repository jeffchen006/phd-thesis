def get_D(xp: uint[N_COINS]) -> uint:
    S: uint = 0
    for _x in xp:
        S += _x
    if S == 0:
        return 0
    Dprev: uint = 0
    D: uint = S
    Ann: uint = self.A * N_COINS
    for _i in range(255):
        D_P: uint = D
        for _x in xp:
            D_P = D_P * D / (_x * N_COINS + 1)  # +1 is to prevent /0
        Dprev = D
        D = (Ann * S + D_P * N_COINS) * D / ((Ann - 1) * D + (N_COINS + 1) * D_P)
        # Equality with the precision of 1
        if D > Dprev:
            if D - Dprev <= 1:
                break
        else:
            if Dprev - D <= 1:
                break
    return D
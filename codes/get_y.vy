def get_y(i: int128, j: int128, x: uint, _xp: uint[N_COINS]) -> uint:
    # x in the input is converted to the same price/precision
    assert (i != j) and (i >= 0) and (j >= 0) and (i < N_COINS) and (j < N_COINS)
    D: uint = self.get_D(_xp)           # key step
    c: uint = D
    S_: uint = 0
    Ann: uint = self.A * N_COINS
    _x: uint = 0
    for _i in range(N_COINS):
        if _i == i:
            _x = x
        elif _i != j:
            _x = _xp[_i]
        else:
            continue
        S_ += _x
        c = c * D / (_x * N_COINS)
    c = c * D / (Ann * N_COINS)
    b: uint = S_ + D / Ann  # - D
    y_prev: uint = 0
    y: uint = D
    for _i in range(255):
        y_prev = y
        y = (y*y + c) / (2 * y + b - D)
        # Equality with the precision of 1
        if y > y_prev:
            if y - y_prev <= 1:
                break
        else:
            if y_prev - y <= 1:
                break
    return y
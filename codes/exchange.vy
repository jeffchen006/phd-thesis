def _exchange(i: int128, j: int128, dx: uint, rates: uint[N_COINS]) -> uint:
    assert not self.is_killed
    # dx and dy are in c-tokens

    xp: uint[N_COINS] = self._xp(rates)

    x: uint = xp[i] + dx * rates[i] / PRECISION
    y: uint = self.get_y(i, j, x, xp)
    dy: uint = xp[j] - y
    dy_fee: uint = dy * self.fee / FEE_DENOMINATOR
    dy_admin_fee: uint = dy_fee * self.admin_fee / FEE_DENOMINATOR
    self.balances[i] = x * PRECISION / rates[i]
    self.balances[j] = (y + (dy_fee - dy_admin_fee)) * PRECISION / rates[j]

    _dy: uint = (dy - dy_fee) * PRECISION / rates[j]

    return _dy
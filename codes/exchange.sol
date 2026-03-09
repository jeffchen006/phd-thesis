function _exchange(int128 i,
    int128 j,
    uint dx,
    uint[] calldata rates
) {
    uint[N_COINS] xp = _xp(rates);
    uint x = xp[i] + dx * rates[i] / PRECISION;
    uint y = get_y(i, j, x, xp);
    uint dy = xp[j] - y;
    uint dy_fee = dy * self.fee / FEE_DENOMINATOR;
    uint dy_admin_fee = dy_fee * self.admin_fee / FEE_DENOMINATOR;
    balances[i] = x * PRECISION / rates[i];
    balances[j] = (y + (dy_fee - dy_admin_fee)) * PRECISION / rates[j]
    uint _dy = (dy - dy_fee) * PRECISION / rates[j]
    return _dy;
}


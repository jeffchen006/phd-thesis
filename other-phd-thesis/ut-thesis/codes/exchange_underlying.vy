def exchange_underlying(i: int128, j: int128, dx: uint, min_dy: uint):
    rates: uint[N_COINS] = self._stored_rates()
    precisions: uint[N_COINS] = PRECISION_MUL
    rate_i: uint = rates[i] / precisions[i]
    rate_j: uint = rates[j] / precisions[j]
    dx_: uint = dx * PRECISION / rate_i

    dy_: uint = self._exchange(i, j, dx_, rates)  # key step: call get_y and then call get_D

    dy: uint = dy_ * rate_j / PRECISION          
    assert dy >= min_dy, "Exchange resulted in fewer coins than expected"
    tethered: bool[N_COINS] = TETHERED
    ok: uint = 0
    if tethered[i]:
        USDT(self.underlying_coins[i]).transferFrom(msg.sender, self, dx)
    else:
        assert_modifiable(ERC20(self.underlying_coins[i])\
            .transferFrom(msg.sender, self, dx))
    ERC20(self.underlying_coins[i]).approve(self.coins[i], dx)
    yERC20(self.coins[i]).deposit(dx)
    yERC20(self.coins[j]).withdraw(dy_)
    # y-tokens calculate imprecisely - use all available
    dy = ERC20(self.underlying_coins[j]).balanceOf(self)
    assert dy >= min_dy, "Exchange resulted in fewer coins than expected"
    if tethered[j]:
        USDT(self.underlying_coins[j]).transfer(msg.sender, dy)
    else:
        assert_modifiable(ERC20(self.underlying_coins[j])\
            .transfer(msg.sender, dy))
    log.TokenExchangeUnderlying(msg.sender, i, dx, j, dy)
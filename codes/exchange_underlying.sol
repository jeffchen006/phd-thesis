function exchange_underlying(
  int128 i,
  int128 j,
  uint dx,
  uint min_dy
) {
  uint[] memory rates = _stored_rates();
  uint N_COINS = rates.length;
  uint[] memory precisions = PRECISION_MUL;
  uint rate_i = rates[i] / precisions[i];
  uint rate_j = rates[j] / precisions[j];
  uint dx_ = (dx * PRECISION) / rate_i;
  // key step: call get_y and then call get_D
  uint dy_ = _exchange(i, j, dx_, rates); 
  uint dy = (dy_ * rate_j) / PRECISION;
  assert(dy >= min_dy, "...");
  bool[] memory tethered = TETHERED;
  uint ok = 0;
  if (tethered[i])
    USDT(u_coins[i]).transferFrom(
        msg.sender, address(this), dx);
  else
    assert_modifiable(
      ERC20(u_coins[i]).transferFrom(
        msg.sender, address(this), dx)
    );
  ERC20(u_coins[i]).approve(coins[i], dx);
  yERC20(coins[i]).deposit(dx);
  yERC20(coins[j]).withdraw(dy_);
  dy=ERC20(u_coins[j]).balanceOf(address(this));
  assert(dy >= min_dy, "...");
  if (tethered[j]) 
    USDT(u_coins[j]).transfer(msg.sender, dy);
  else assert_modifiable(ERC20(u_coins[j])
    .transfer(msg.sender, dy));
  log.TokenExchangeUnderlying(msg.sender, i, dx, j, dy);
}

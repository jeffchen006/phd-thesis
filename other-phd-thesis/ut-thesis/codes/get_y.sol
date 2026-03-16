function get_y(
  int128 i,
  int128 j,
  uint x,
  uint[] calldata _xp
) returns (uint) {
  uint N_COINS = _xp.length;
  assert(
    i != j && i >= 0 && j >= 0 && 
    uint(i) < N_COINS && uint(j) < N_COINS
  );
  uint D = get_D(_xp);
  uint c = D;
  uint S_ = 0;
  uint Ann = A * N_COINS; // A is a constant member variable selected by the owner of the contract
  uint _x = 0;
  for (uint _i = 0; _i < N_COINS; _i = _i + 1) {
    if (_i == uint(i)) {
      _x = x;
    } else if (_i != uint(j)) {
      _x = _xp[_i];
    } else continue;
    S_ += _x;
    c = (c * D) / (_x * N_COINS);
  }
  c = (c * D) / (Ann * N_COINS);
  uint b = S_ + D / Ann; // - D
  uint y_prev = 0;
  uint y = D;
  for (uint _i = 0; _i < 255; _i = _i + 1) {
    y_prev = y;
    y = (y * y + c) / (2 * y + b - D);
    // Equality with the precision of 1
    if (y > y_prev) {
      if (y - y_prev <= 1) break;
    } else {
      if (y_prev - y <= 1) break;
    }
  }
  return y;
}

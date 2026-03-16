function get_D(uint[] calldata xp) returns (uint) {
  uint N_COINS = xp.length;
  uint S = 0;
  for (uint i = 0; i < xp.length; i = i + 1) {
    uint x = xp[i];
    S += x;
  }
  if (S == 0) return 0;
  uint Dprev = 0;
  uint D = S;
  uint Ann = A * N_COINS; // A: a constant selected by the owner of the contract
  for (uint i = 0; i < 255; i = i + 1) {
    uint D_P = D;
    for (uint j = 0; j < xp.length; j = j + 1) {
      uint x = xp[j];
      D_P = (D_P * D) / (x * N_COINS + 1); // +1 to prevent /0
    }
    Dprev = D;
    D = ((Ann * S + D_P * N_COINS) * D) /
        ((Ann - 1) * D + (N_COINS + 1) * D_P);
    // Equality with the precision of 1
    if (D > Dprev) {
      if (D - Dprev <= 1) break;
    } else {
      if (Dprev - D <= 1) break;
    }
  }
  return D;
}

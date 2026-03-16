function get_D(uint[] xp) returns (uint) {
  uint N_COINS = xp.length;
  uint S = sum(xp);
  // ...
  uint D = S;
  uint Ann = A * N_COINS; // A is a constant  
  for (uint i = 0; i < 255; i = i + 1) {
    uint D_P = D;
    for (uint j = 0; j < xp.length; j = j + 1) {
      D_P = (D_P * D) / (xp[j] * N_COINS + 1); }
    uint Dprev = D;
    D = ((Ann * S + D_P * N_COINS) * D) /
      ((Ann - 1) * D + (N_COINS + 1) * D_P);
      if (abs(D - Dprev) <= 1) { break; }  
  }
    return D;    
}

function get_D(uint x1) public returns (uint) {
    uint S = x1;
    if (S == 0) {
        return 0;
    }
    uint D = S;
    uint Ann = 1000 * 1;
    uint D_P = D;
    D_P = (D_P * D) / (x1 * 4 + 1);
    D = ((Ann * S + D_P * 1) * D) / ((Ann - 1) * D + (1 + 1) * D_P);
    return D;
}

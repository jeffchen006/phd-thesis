contract ERC20 {
    //...
    mapping(address => uint) _balances;
    event Transfer(address from, address to, uint amt);
    function transfer(address from, address to,
        uint amt) public {
        require(from != address(0), "...");
        require(to != address(0), "...");
        uint fromBal = _balances[from];
        require(fromBal >= amt, "...");
        _balances[from] = fromBal - amt;
        _balances[to] += amt;
        emit Transfer(from, to, amt);
    }
}

function _deposit(
    uint amount,
    address sender,
    address beneficiary
) internal {
    require(amount > 0, "Cannot deposit 0");
    require(beneficiary != address(0), "holder must be defined");
    if (address(strategy()) != address(0)) {
        require(IStrategy(strategy()).depositArbCheck(), "Too much arb");
    }
    uint toMint = totalSupply() == 0
        ? amount
        : amount.mul(totalSupply()).div(underlyingBalanceWithInvestment());
    _mint(beneficiary, toMint);
    IERC20(underlying()).safeTransferFrom(sender, address(this), amount);
    emit Deposit(beneficiary, amount);
}

function withdraw(uint numberOfShares) external {
    require(totalSupply() > 0, "Vault has no shares");
    require(numberOfShares > 0, "numberOfShares must be greater than 0");
    uint totalSupply = totalSupply();
    _burn(msg.sender, numberOfShares);
    uint underlyingAmountToWithdraw = underlyingBalanceWithInvestment()
        .mul(numberOfShares)
        .div(totalSupply);
    if (underlyingAmountToWithdraw > underlyingBalanceInVault()) {
        if (numberOfShares == totalSupply) {
            IStrategy(strategy()).withdrawAllToVault();
        } else {
            uint missing = underlyingAmountToWithdraw.sub(
                underlyingBalanceInVault()
            );
            IStrategy(strategy()).withdrawToVault(missing);
        }
        underlyingAmountToWithdraw = Math.min(
            underlyingBalanceWithInvestment().mul(numberOfShares).div(
                totalSupply
            ),
            underlyingBalanceInVault()
        );
    }
    IERC20(underlying()).safeTransfer(msg.sender, underlyingAmountToWithdraw);
    emit Withdraw(msg.sender, underlyingAmountToWithdraw);
}

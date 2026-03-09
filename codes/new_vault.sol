function deposit(uint amt) {
    //...
  uint BalInvest = BalInVault() + investedBal();
  uint toMint = amt * totalSupply() / BalInvest;
  _mint(msg.sender, toMint);
  USDC.transferFrom(msg.sender, address(this), amt);
}

function withdraw(uint share) {
    //...
  uint balInvest = balInVault() + investedBal();
  uint amtToWd = balInvest * share / totalSupply();
  USDC.transfer(msg.sender, amtToWd);
}

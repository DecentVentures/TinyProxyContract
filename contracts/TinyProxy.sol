pragma solidity ^0.4.17;

contract TinyProxy {
  address public receiver;
  uint public gasBudget;

  function TinyProxy(address toAddr, uint proxyGas) public {
    receiver = toAddr;
    gasBudget = proxyGas;
  }

  event FundsReceived(uint amount);
  event FundsReleased(address to, uint amount);

  function () payable public {
    emit FundsReceived(msg.value);
  }

  function release() public {
    uint balance = address(this).balance;
    if(gasBudget > 0){
      require(receiver.call.gas(gasBudget).value(balance)());
    } else {
      require(receiver.send(balance));
    }
    emit FundsReleased(receiver, balance);
  }
}

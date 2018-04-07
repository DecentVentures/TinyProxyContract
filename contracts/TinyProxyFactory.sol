pragma solidity ^0.4.17;
import "./TinyProxy.sol";

contract TinyProxyFactory {
  mapping(address => mapping(uint => address)) public proxyFor;
  mapping(address => address[]) public userProxies;

  event ProxyDeployed(address to, uint gas);
  function make(address to, uint gas, bool track) public returns(address proxy){
    proxy = new TinyProxy(to, gas);
    if(track) {
      proxyFor[to][gas] = proxy;
      userProxies[msg.sender].push(proxy);
    }
    emit ProxyDeployed(to, gas);
    return proxy;
  }
}

var TinyProxyFactory = artifacts.require("./TinyProxyFactory.sol");

module.exports = function(deployer) {
  deployer.deploy(TinyProxyFactory);
};

var EthereanFactory = artifacts.require("./EthereanFactory.sol");

module.exports = function(deployer) {
  deployer.deploy(EthereanFactory);
};
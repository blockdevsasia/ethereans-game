var EthereanCore = artifacts.require("./EthereanCore.sol");

module.exports = function(deployer) {
  deployer.deploy(EthereanCore);
};
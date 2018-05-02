import { Drizzle, generateStore } from 'drizzle';

App = {
  web3Provider: null,
  contracts: {},

  init: function() {
    return App.initWeb3();
  },

  initWeb3: function() {
    // Initialize web3 and set the provider to the testRPC.
    if (typeof web3 !== 'undefined') {
      App.web3Provider = web3.currentProvider;
      web3 = new Web3(web3.currentProvider);
    } else {
      // set the provider you want from Web3.providers
      App.web3Provider = new Web3.providers.HttpProvider('http://127.0.0.1:7545');
      web3 = new Web3(App.web3Provider);
    }

    return App.initContract();
  },

  initContract: function() {
    $.getJSON('EthereanCore.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with truffle-contract.
      var EthereanTokenArtifact = data;
      App.contracts.EthereanToken = TruffleContract(EthereanTokenArtifact);

      // Set the provider for our contract.
      App.contracts.EthereanToken.setProvider(App.web3Provider);
      console.log('got json for contract');

    });

    return App.bindEvents();
  },

  makeOffering: function() {
    App.contracts.EthereanToken.deployed().then(function(instance) {
      console.log('lets make an offering')
      ethereanTokenInstance = instance;
      
      var defaultAccount = web3.eth.defaultAccount;
      return ethereanTokenInstance.makeOffering(defaultAccount);

    }).then(function(result) {
      console.log('Offering Successful! An Etherean is interested and will answer back to address ', result);
      return;
    }).catch(function(err) {
      console.log(err.message);
    });
  },

  bindEvents: function() {
    $(document).on('click', '#transferButton', App.makeOffering);
  },

};

$(function() {
  $(window).load(function() {
    App.init();
  });
});
